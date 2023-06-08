import 'package:demirli_tech_v2/config/app_space.dart';
import 'package:demirli_tech_v2/config/app_text_style.dart';
import 'package:demirli_tech_v2/domain/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeSection extends StatefulWidget {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {

  double _textOpacity = 0;
  double _buttonOpacity = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if(_textOpacity == 0) {
          if(context.mounted) {
            startInitAnimation();
          }
        }
      }
    );
    super.initState();
  }

  Future<void> startInitAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    await startTextAnimation();
    await Future.delayed(const Duration(seconds: 1));
    await startButtonAnimation();
  }

  Future<void> startTextAnimation() async {
    setState(() {
      _textOpacity = 1;
    });
  }

  Future<void> startButtonAnimation() async {
    setState(() {
      _buttonOpacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _textOpacity,
            duration: const Duration(seconds: 2),
            child: Text(
              "İnşaat sektörüne inovatif ve vizyoner araçlar",
              style: AppTextStyle.h2!.copyWith(color: Theme.of(context).colorScheme.onTertiaryContainer),
            )
          ),
          AppSpace.vXL!,
          AnimatedOpacity(
            opacity: _buttonOpacity,
            duration: const Duration(seconds: 1),
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<AppCubit>(context).animateToSection(context, 1);
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
      ),
    );
  }
}
