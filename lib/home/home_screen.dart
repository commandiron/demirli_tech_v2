import 'package:demirli_tech_v2/domain/bloc/app_bloc.dart';
import 'package:demirli_tech_v2/domain/bloc/app_event.dart';
import 'package:demirli_tech_v2/widgets/app_fab.dart';
import 'package:demirli_tech_v2/widgets/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/bloc/state/app_state.dart';
import '../widgets/body_base.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
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
              onLeadingTap: () => context.read<AppBloc>().add(const AppBarLeadingTap()),
              onButtonTap: (sectionIndex) => context.read<AppBloc>().add(AppBarButtonTap(sectionIndex)),
            ),
            BlocBuilder<AppBloc, AppState>(
              buildWhen: (previous, current) {
                return previous.bodySections != current.bodySections;
              },
              builder: (context, state) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.bodySections.length,
                    (context, index) {
                      return BodyBase(
                        height: state.bodySections[index].screenHeight,
                        bgColor: state.bodySections[index].bgColor,
                        child: state.bodySections[index].section,
                      );
                    }
                  ),
                );
              },
            )
          ],
        ),
      ],
    ));
  }
}
