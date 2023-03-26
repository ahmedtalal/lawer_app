import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_helper.dart';
import 'package:hokok/presentation/blocs/comment_bloc/comment_bloc.dart';
import 'package:hokok/presentation/blocs/feedback_bloc/feedback_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:hokok/presentation/screen/layout/cubit/layout_cubit.dart';
import 'package:hokok/config/l10n/l10n.dart';

import '../presentation/screen/main/component/cubit/main_cubit.dart';
import '../core/routes_manager.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => MajorBloc(),
        ),
        BlocProvider(
          create: (context) => FeedBackBloc(),
        ),
        BlocProvider(
          create: (context) => CommentBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        //initialRoute: AuthBlocHelper.instance().checkUserIsLoginActtion(),
        home: AuthHelper.instance().checkUserIsLoginActtion(),
      ),
    );
  }
}
