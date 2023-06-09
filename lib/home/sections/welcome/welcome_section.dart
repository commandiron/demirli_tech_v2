import 'package:demirli_tech_v2/config/app_space.dart';
import 'package:demirli_tech_v2/config/app_text_style.dart';
import 'package:demirli_tech_v2/domain/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/app_cubit.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        BlocProvider.of<AppCubit>(context, listen: false).startWelcomeAnimation();
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: state.welcomeAnimationAttr.textOpacity,
              duration: const Duration(seconds: 2),
              child: Text(
                "İnşaat sektörü için inovatif ve vizyoner araçlar geliştiriyoruz",
                style: AppTextStyle.h2!,
              )
            ),
            AppSpace.vXL!,
            AnimatedOpacity(
              opacity: state.welcomeAnimationAttr.textOpacity,
              duration: const Duration(seconds: 1),
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AppCubit>(context).animateToSection(
                      context, 1);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Keşfet", style: AppTextStyle.h5,),
                    AppSpace.hL!,
                    const Icon(Icons.arrow_forward_ios, size: 16,)
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
