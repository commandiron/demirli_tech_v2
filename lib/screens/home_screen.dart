import 'package:demirli_tech_v2/config/app_padding.dart';
import 'package:demirli_tech_v2/config/app_space.dart';
import 'package:demirli_tech_v2/config/app_text_style.dart';
import 'package:demirli_tech_v2/config/constants.dart';
import 'package:demirli_tech_v2/widgets/custom_app_bar/custom_sliver_app_bar.dart';
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
                onButtonTap: (offset) => _controller.animateTo(
                  _controller.offset < offset ? offset + Constants.appBarHeight : offset,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.ease
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: widget.bodySections.length,
                  (context, index) {
                    return BodyBase(
                      height: widget.bodySections[index].screenHeight,
                      color: widget.bodySections[index].color,
                      title: widget.bodySections[index].title,
                      child: widget.bodySections[index].section,
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

class BodyBase extends StatelessWidget {
  const BodyBase({Key? key, required this.height, required this.color, this.title, this.child,}) : super(key: key);

  final double height;
  final Color color;
  final String? title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
      child: Column(
        children: [
          if(title != null)
            Padding(
              padding: AppPadding.hXXL!.add(AppPadding.vXL!),
              child: Row(
                children: [
                  Text(title!.toUpperCase(), style: AppTextStyle.h5b,),
                  AppSpace.hL!,
                  SizedBox(width: 70, child: Divider(thickness: 3, color: Theme.of(context).colorScheme.primary,))
                ],
              ),
            ),
          if(child != null)
            child!
        ],
      )
    );
  }
}
