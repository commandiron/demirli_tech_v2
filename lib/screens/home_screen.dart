import 'package:demirli_tech_v2/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';

import '../main/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.bodySections}) : super(key: key);

  final List<BodySection> bodySections;

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
                bodySections: widget.bodySections,
                onLeadingTap: () => _controller.animateTo(0, duration: const Duration(milliseconds: 1000), curve: Curves.ease),
                onButtonTap: (offset) => _controller.animateTo(offset, duration: const Duration(milliseconds: 1000), curve: Curves.ease),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: widget.bodySections.length,
                  (context, index) {
                    return Container(
                      height: widget.bodySections[index].screenHeight,
                      color: widget.bodySections[index].color,
                      child: Center(child: Text(widget.bodySections[index].title),),
                    );
                  }
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}