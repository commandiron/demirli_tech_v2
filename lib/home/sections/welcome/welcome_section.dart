import 'package:demirli_tech_v2/config/app_space.dart';
import 'package:demirli_tech_v2/config/app_text_style.dart';
import 'package:demirli_tech_v2/config/layout_dimensions.dart';
import 'package:demirli_tech_v2/domain/bloc/app_bloc.dart';
import 'package:demirli_tech_v2/domain/bloc/state/app_state.dart';
import 'package:demirli_tech_v2/home/sections/welcome/widget/welcome_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  static const index = 0;
  static const title = "Ana Sayfa";
  static const double offset = 0;

  static double calculateHeight(BuildContext context) {
    const double welcomeMinHeight = 650 - LayoutDimensions.appBarHeight;
    double welcomeHeight =
        MediaQuery.of(context).size.height - LayoutDimensions.appBarHeight;
    if (welcomeHeight < welcomeMinHeight) {
      welcomeHeight = welcomeMinHeight;
    }
    return welcomeHeight;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) {
        return previous.welcomeAnimationState != current.welcomeAnimationState;
      },
      builder: (context, state) {
        return Container(
          height: calculateHeight(context),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: state.welcomeAnimationState.bgAnimationDuration),
                opacity: state.welcomeAnimationState.bgOpacity,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: state.welcomeAnimationState.textOpacity,
                    duration: Duration(milliseconds: state.welcomeAnimationState.textAnimationDuration),
                    child: Text(
                      "İnşaat sektörü için inovatif ve vizyoner araçlar geliştiriyoruz",
                      style: AppTextStyle.h2!,
                      textAlign: TextAlign.center,
                    )
                  ),
                  AppSpace.vXL!,
                  AnimatedOpacity(
                    opacity: state.welcomeAnimationState.buttonOpacity,
                    duration: Duration(milliseconds: state.welcomeAnimationState.buttonAnimationDuration),
                    child: const WelcomeButton()
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
