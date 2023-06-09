import 'package:demirli_tech_v2/config/app_theme.dart';
import 'package:demirli_tech_v2/config/constants.dart';
import 'package:demirli_tech_v2/domain/bloc/app_bloc.dart';
import 'package:demirli_tech_v2/domain/bloc/app_event.dart';
import 'package:demirli_tech_v2/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

import 'config/app_config.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      title: Constants.appTitle,
      home: const MaterialChild()
    );
  }
}

class MaterialChild extends StatelessWidget {
  const MaterialChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()..add(Init(context)),
      child: const HomeScreen(),
    );
  }
}