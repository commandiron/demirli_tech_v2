import 'package:demirli_tech_v2/config/layout_dimensions.dart';
import 'package:demirli_tech_v2/widgets/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';

import '../ui_model/body_section.dart';
import '../widgets/body_base.dart';

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
            SliverLayoutBuilder(
              builder: (context, constraints) {
                print(constraints);
                return CustomSliverAppBar(
                  bodySections: widget.bodySections,
                  onLeadingTap: () => _controller.animateTo(0,
                      duration: const Duration(seconds: 1), curve: Curves.ease),
                  onButtonTap: (offset) => _controller.animateTo(
                      _controller.offset < offset
                          ? offset + LayoutDimensions.appBarHeight
                          : offset,
                      duration: const Duration(seconds: 1),
                      curve: Curves.ease),
                );
              },
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: widget.bodySections.length, (context, index) {
                return BodyBase(
                  height: widget.bodySections[index].screenHeight,
                  color: widget.bodySections[index].color,
                  title: widget.bodySections[index].showTitleAsHeader
                      ? widget.bodySections[index].title
                      : null,
                  child: widget.bodySections[index].section,
                );
              }),
            )
          ],
        ),
      ],
    ));
  }
}
