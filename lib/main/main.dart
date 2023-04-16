import 'package:demirli_tech_v2/theme/app_theme.dart';
import 'package:demirli_tech_v2/screens/home_screen.dart';
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
      home: const MaterialChild()
    );
  }
}

class MaterialChild extends StatelessWidget {
  const MaterialChild({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HomeScreen(bodySections: BodySection.getItems(context));
  }
}

class BodySection{
  BodySection(
    {
      required this.title,
      required this.screenHeight,
      required this.offset,
      required this.color,
      this.showButton = true,
    }
  );

  final String title;
  final double screenHeight;
  final double offset;
  final Color color;
  final bool showButton;

  static List<BodySection> getItems(BuildContext context) {
    return [
      BodySection(title: "Welcome", screenHeight: 960, offset: 0, color: Colors.purple, showButton: false),
      BodySection(title: "About", screenHeight: 360, offset: 960, color: Theme.of(context).colorScheme.primaryContainer),
      BodySection(title: "Products", screenHeight: 960, offset: 960+360, color: Theme.of(context).colorScheme.secondaryContainer),
      BodySection(title: "Our Vision", screenHeight: 720, offset: 960+360+960, color: Theme.of(context).colorScheme.primaryContainer),
      BodySection(title: "Contact us", screenHeight: 360, offset: 960+360+960+720, color: Theme.of(context).colorScheme.secondaryContainer),
      BodySection(title: "Copyright Footer", screenHeight: 45, offset: 960+360+960+720+360, color: Theme.of(context).colorScheme.primaryContainer, showButton: false),
    ];
  }
}