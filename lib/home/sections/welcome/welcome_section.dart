import 'package:demirli_tech_v2/config/app_space.dart';
import 'package:demirli_tech_v2/config/app_text_style.dart';
import 'package:demirli_tech_v2/domain/app_bloc.dart';
import 'package:demirli_tech_v2/domain/app_event.dart';
import 'package:demirli_tech_v2/domain/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: state.welcomeAnimationState.textOpacity,
              duration: Duration(seconds: state.welcomeAnimationState.textAnimationDurationInSecond),
              child: Text(
                "İnşaat sektörü için inovatif ve vizyoner araçlar geliştiriyoruz",
                style: AppTextStyle.h2!,
              )
            ),
            AppSpace.vXL!,
            AnimatedOpacity(
              opacity: state.welcomeAnimationState.buttonOpacity,
              duration: Duration(seconds: state.welcomeAnimationState.buttonAnimationDurationInSecond),
              child: ElevatedButton(
                onPressed: () {
                  context.read<AppBloc>().add(NavigateSection(context, 1));
                },
                onHover: (value) {
                  context.read<AppBloc>().add(OnWelcomeButtonHover(value));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Keşfet", style: AppTextStyle.h5,),
                    AppSpace.hL!,
                    Icon(state.uiState.welcomeButtonIcon, size: 16,)
                  ],
                )
              )
            ),
          ],
        );
      },
    );
  }
}
