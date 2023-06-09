import 'package:demirli_tech_v2/domain/app_cubit.dart';
import 'package:demirli_tech_v2/ui_model/body_section.dart';
import 'package:demirli_tech_v2/widgets/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/app_state.dart';
import '../widgets/body_base.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.bodySections}) : super(key: key);

  final List<BodySection> bodySections;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
          body: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomScrollView(
              controller: state.controller,
              slivers: [
                CustomSliverAppBar(
                  bodySections: bodySections,
                  onAppLogoPressed: () => BlocProvider.of<AppCubit>(context).animateToSection(context, 0),
                  onButtonPressed: (sectionIndex) {
                    BlocProvider.of<AppCubit>(context).animateToSection(context, sectionIndex);
                  },
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: bodySections.length, (context, index) {
                      return BodyBase(
                        height: bodySections[index].screenHeight,
                        bgColor: bodySections[index].bgColor,
                        bgImageAsset: bodySections[index].bgImageAsset,
                        title: bodySections[index].showTitleAsHeader
                            ? bodySections[index].title
                            : null,
                        child: Expanded(
                          child: bodySections[index].section
                        ),
                      );
                    }
                  ),
                )
              ],
            ),
          ],
        ));
      },
    );
  }
}
