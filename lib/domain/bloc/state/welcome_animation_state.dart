abstract class WelcomeAnimationState {
  final int textAnimationDuration;
  final double textOpacity;
  final int buttonAnimationDuration;
  final double buttonOpacity;
  final int appBarAnimationDuration;
  final double appBarOpacity;
  final int bgAnimationDuration;
  final double bgOpacity;
  WelcomeAnimationState(
    {
      this.textAnimationDuration = 2000,
      required this.textOpacity,
      this.buttonAnimationDuration = 1000,
      required this.buttonOpacity,
      this.appBarAnimationDuration = 1000,
      required this.appBarOpacity,
      this.bgAnimationDuration = 1000,
      required this.bgOpacity,
    }
  );
}

class WelcomeAnimationInitial extends WelcomeAnimationState{
  WelcomeAnimationInitial(
    {
      super.textOpacity = 0,
      super.buttonOpacity = 0,
      super.appBarOpacity = 0,
      super.bgOpacity = 1,
    }
  );
}

class WelcomeAnimationStepOne extends WelcomeAnimationState{
  WelcomeAnimationStepOne(
    {
      super.textOpacity = 1,
      super.buttonOpacity = 0,
      super.appBarOpacity = 0,
      super.bgOpacity = 1,
    }
  );
}

class WelcomeAnimationStepTwo extends WelcomeAnimationState{
  WelcomeAnimationStepTwo(
    {
      super.textOpacity = 1,
      super.buttonOpacity = 1,
      super.appBarOpacity = 0,
      super.bgOpacity = 1,
    }
  );
}

class WelcomeAnimationStepThree extends WelcomeAnimationState{
  WelcomeAnimationStepThree(
    {
      super.textOpacity = 1,
      super.buttonOpacity = 1,
      super.appBarOpacity = 1,
      super.bgOpacity = 0,
    }
  );
}