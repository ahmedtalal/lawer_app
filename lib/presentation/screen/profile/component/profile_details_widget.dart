import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/shared_widget/text.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    this.paddingRight = AppPadding.p59,
    this.positionRight = AppSize.s15,
    Key? key,
  }) : super(key: key);

  final double paddingRight;
  final double positionRight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppPadding.p10, right: paddingRight),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: AppSize.s105,
                    width: AppSize.s116,
                    margin: const EdgeInsets.only(top: AppMargin.m48),
                    padding: const EdgeInsets.all(AppPadding.p10),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      border:
                      Border.all(color: ColorManager.grey, width: 0.5),
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                  Container(
                    height: AppSize.s34,
                    width: AppSize.s34,
                    padding: const EdgeInsets.all(AppPadding.p5),
                    decoration: BoxDecoration(
                      color: ColorManager.secondary,
                      border:
                      Border.all(color: ColorManager.grey, width: 0.5),
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: SvgPicture.asset(
                      AssetsManager.cameraIcon,
                    ),
                  ),
                ],
              ),
              /*Container(
                height: AppSize.s105,
                width: AppSize.s116,
                padding: const EdgeInsets.all(AppPadding.p10),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.grey, width: 0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.elliptical(
                      AppSize.s116,
                      AppSize.s107,
                    ),
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(
                        AppSize.s116,
                        AppSize.s107,
                      ),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        AppStrings.testImage,
                      ),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                ),
              ),*/
              const Padding(
                padding: EdgeInsets.symmetric(vertical: AppPadding.p2),
                child: DefaultText(
                  AppStrings.name,
                  fontSize: FontSize.s26,
                  color: ColorManager.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetsManager.locationIcon),
                  const DefaultText(
                    AppStrings.location,
                    fontSize: FontSize.s10,
                    color: ColorManager.secondary,
                  ),
                ],
              ),
            ],
          ),
        ),
        /*Positioned(
          top: AppSize.s79,
          right: positionRight,
          height: AppSize.s9,
          width: AppSize.s63,
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.secondary,
              borderRadius: BorderRadius.circular(AppSize.s4),
            ),
            child: const DefaultText(
              AppStrings.active,
              fontSize: FontSize.s6,
              color: ColorManager.white,
              textAlign: TextAlign.center,
            ),
          ),
        ),*/
      ],
    );
  }
}
