import 'package:demirli_tech_v2/domain/app_bloc.dart';
import 'package:demirli_tech_v2/domain/app_event.dart';
import 'package:demirli_tech_v2/ui_model/body_section.dart';
import 'package:demirli_tech_v2/widgets/app_fab.dart';
import 'package:demirli_tech_v2/widgets/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/body_base.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.bodySections}) : super(key: key);

  final List<BodySection> bodySections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      floatingActionButton: const AppFab(),
      body: Stack(
      alignment: Alignment.topCenter,
      children: [
        CustomScrollView(
          controller: context.read<AppBloc>().state.appScrollController,
          slivers: [
            CustomSliverAppBar(
              bodySections: bodySections,
              onLeadingTap: () => context.read<AppBloc>().add(AppBarLeadingTap(context)),
              onButtonTap: (sectionIndex) {
                context.read<AppBloc>().add(AppBarButtonTap(context, sectionIndex));
              },
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: bodySections.length, (context, index) {
                  return BodyBase(
                    height: bodySections[index].screenHeight,
                    bgColor: bodySections[index].bgColor,
                    bgImageAsset: bodySections[index].bgImageAsset,
                    child: bodySections[index].section,
                  );
                }
              ),
            )
          ],
        ),
      ],
    ));
  }
}
