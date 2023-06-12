import 'package:demirli_tech_v2/config/app_padding.dart';
import 'package:demirli_tech_v2/domain/app_bloc.dart';
import 'package:demirli_tech_v2/domain/app_event.dart';
import 'package:demirli_tech_v2/ui_model/body_section.dart';
import 'package:demirli_tech_v2/widgets/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/app_state.dart';
import '../widgets/body_base.dart';
import '../widgets/move_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.bodySections}) : super(key: key);

  final List<BodySection> bodySections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      floatingActionButton: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return AnimatedSlide(
            duration: const Duration(milliseconds: 250),
            offset: state.showScrollToTopFab ? Offset.zero : const Offset(2, 0),
            child: Padding(
              padding: AppPadding.allM!,
              child: MoveButton(
                  icon: Icons.arrow_drop_up,
                  onTap: () {

                  },
                ),
            ),
          );
        },
      ),
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
