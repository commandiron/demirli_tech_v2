import 'package:demirli_tech_v2/domain/bloc/app_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/app_padding.dart';
import '../domain/bloc/app_bloc.dart';
import '../domain/bloc/state/app_state.dart';
import 'move_button.dart';

class AppFab extends StatelessWidget {
  const AppFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return AnimatedSlide(
          duration: Duration(milliseconds: state.scrollToTopFabState.animationDuration),
          offset: Offset(state.scrollToTopFabState.offsetX, 0),
          child: Padding(
            padding: AppPadding.allM!,
            child: MoveButton(
              icon: Icons.arrow_drop_up,
              onTap: () => context.read<AppBloc>().add(ScrollToTop(context)),
            ),
          ),
        );
      },
    );
  }
}
