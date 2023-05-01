import 'package:flutter/material.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/circler_loader_shared_widget.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/domain/entities/client_profile_entity.dart';
import 'package:hokok/domain/entities/lawyer_profile_entity.dart';

abstract class ProfileStates {}

class ProfileInitState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {
  showLoadingDialog(BuildContext context) async {
    return await showCircleLoaderWidget(context);
  }
}

class LawyerProfileLoadedState extends ProfileStates {
  LawyerProfileEntity? userEntity;
  LawyerProfileLoadedState(this.userEntity);
}

class ClientProfileLoadedState extends ProfileStates {
  ClientProfileEntity? userEntity;
  ClientProfileLoadedState(this.userEntity);
}

class ProfileFailedState extends ProfileStates {
  dynamic error;
  ProfileFailedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context)
        .showSnackBar(showSnakBarWidget(context, title, Colors.red));
  }
}

class PorfileUpdatedSuccessState extends ProfileStates {
  naviation(RouteSettings settings, BuildContext context) {
    return Navigator.of(context).push(RouteGenerator.getRoute(settings));
  }
}

class ProfileLoadingActionState extends ProfileStates {}
