abstract class ScrollToTopFabState {
  final int animationDuration;
  final double offsetX;
  ScrollToTopFabState (
      {
        this.animationDuration = 250,
        required this.offsetX,
      }
      );
}
class ScrollToTopFabHidden extends ScrollToTopFabState{
  ScrollToTopFabHidden({super.offsetX = 2});
}
class ScrollToTopFabVisible extends ScrollToTopFabState{
  ScrollToTopFabVisible({super.offsetX = 0});
}