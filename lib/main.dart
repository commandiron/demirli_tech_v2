import 'package:demirli_tech_v2/app_body.dart';
import 'package:demirli_tech_v2/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      title: "Demirli Tech",
      home: Scaffold(
        backgroundColor: Color(0xff06080D),
        body: const AppBody()
      )
    );
  }
}