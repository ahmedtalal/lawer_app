import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/components/appbar_comp/app_bar_widget.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';

import '../../../../../core/routes_manager.dart';

class LawyerIssuesScreen extends StatefulWidget {
  const LawyerIssuesScreen({super.key});

  @override
  State<LawyerIssuesScreen> createState() => _LawyerIssuesScreenState();
}

class _LawyerIssuesScreenState extends State<LawyerIssuesScreen> {
  @override
  void initState() {
    OrderHelper.instance().getOwnOrdersForLawyerAction(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppBarWidget(
                onClick: () {
                  Navigator.of(context).push(
                    RouteGenerator.getRoute(
                      const RouteSettings(
                        name: Routes.notificatiosLawyersScreen,
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.notifications,
                  color: ColorManager.thirdy,
                  size: 30.sp,
                ),
                child: Image(
                  image: const AssetImage(
                    AssetsManager.logo,
                  ),
                  width: 180.w,
                  height: 100.h,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Expanded(
              flex: 3,
              child: _BodyWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    super.key,
  });
  static List<OwnOrdersInfoModel> ownOrders = [];
  @override
  Widget build(BuildContext context) {
    OrderHelper.instance().publishedDateFormat("2023/3/4 03:31:42");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "القضايا الحالية",
          style: TextStyle(
            fontSize: 23.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        const _TableColumnsWidget(),
        Expanded(
          child:
              BlocConsumer<OrderBloc, OrderStates>(listener: (context, state) {
            if (state is OrderFailedLoadedState) {
              state.authErrorMessage(context, state.error);
            } else if (state is OwnOrderLoadedState) {
              ownOrders = state.ownOrdes!;
            }
          }, builder: (context, state) {
            if (state is OrderLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is OwnOrderLoadedState) {
            } else if (state is OrderFailedLoadedState) {
              return emptyDataSharedWidget();
            }
            return ListView.builder(
              padding: EdgeInsets.only(top: 10.h),
              itemCount: ownOrders.length,
              itemBuilder: (context, index) {
                return _LawyerIssuesViewWidget(order: ownOrders[index]);
              },
            );
          }),
        )
      ],
    );
  }
}

class _TableColumnsWidget extends StatelessWidget {
  const _TableColumnsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHandler.getScreenHeight(context),
      height: 40.h,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "اسم الطلب",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Text(
            "تاريخ النشر",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Text(
            "موعد الإنتهاء",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

class _LawyerIssuesViewWidget extends StatelessWidget {
  const _LawyerIssuesViewWidget({
    required this.order,
    super.key,
  });
  final OwnOrdersInfoModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHandler.getScreenHeight(context),
      height: 40.h,
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      margin: EdgeInsets.only(
        bottom: 10.h,
        right: 5.w,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            order.title!,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Text(
            OrderHelper.instance()
                .publishedDateFormat(order.assignedToLawyerAt!),
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Row(
            children: [
              Text(
                order.clientExpectedDate!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontConstants.fontFamily,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
