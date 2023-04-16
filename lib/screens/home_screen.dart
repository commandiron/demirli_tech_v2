import 'package:demirli_tech_v2/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomScrollView(
            controller: _controller,
            slivers: [
              CustomSliverAppBar(
                onLeadingTap: () => _controller.animateTo(0, duration: Duration(milliseconds: 1000), curve: Curves.ease),
                onButtonTap: (offset) => _controller.animateTo(offset, duration: Duration(milliseconds: 1000), curve: Curves.ease),
              ),
              SliverToBoxAdapter(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: BodySection.getItems(context).map(
                    (item)  {
                      return Container(
                        height: item.screenHeight,
                        color: item.color,
                        child: Center(child: Text(item.title),),
                      );
                    }
                  ).toList()
                ),
              )
            ],
          ),
        ],
      )
    );
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