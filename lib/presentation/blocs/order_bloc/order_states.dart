import 'package:flutter/material.dart';
import 'package:hokok/core/shared_widget/circler_loader_shared_widget.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';

abstract class OrderStates {}

class OrdersInitState extends OrderStates {}

class OrderLoadingState extends OrderStates {
  showLoadingDialog(BuildContext context) async {
    return await showCircleLoaderWidget(context);
  }
}

class PublicOrderLoadedState extends OrderStates {
  List<OrderInfoModel>? orders;
  PublicOrderLoadedState(this.orders);
}

class OwnOrderLoadedState extends OrderStates {
  List<OwnOrdersInfoModel>? ownOrdes;
  OwnOrderLoadedState(this.ownOrdes);
}

class OrderFailedLoadedState extends OrderStates {
  String error;
  OrderFailedLoadedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context)
        .showSnackBar(showSnakBarWidget(context, title, Colors.red));
  }
}
