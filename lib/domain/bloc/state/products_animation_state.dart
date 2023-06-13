import '../../../config/layout_dimensions.dart';

abstract class ProductsAnimationState {
  final int titleLineAnimationDurationInSecond;
  final double titleLineWidth;
  final int decorativeTitleAnimationDuration;
  final double decorativeTitleContainerHeight;
  final int sliderAnimationDuration;
  final double sliderOffsetY;
  final double sliderOpacity;
  final int productItemAnimationDuration;
  final double productItemOpacity;
  final int buttonsAnimationDuration;
  final double backButtonOffsetX;
  final double nextButtonOffsetX;
  ProductsAnimationState(
      {
        this.titleLineAnimationDurationInSecond = 1000,
        required this.titleLineWidth,
        this.decorativeTitleAnimationDuration = 500,
        required this.decorativeTitleContainerHeight,
        this.sliderAnimationDuration = 1000,
        required this.sliderOffsetY,
        required this.sliderOpacity,
        this.productItemAnimationDuration = 800,
        required this.productItemOpacity,
        this.buttonsAnimationDuration = 600,
        required this.backButtonOffsetX,
        required this.nextButtonOffsetX,
      }
      );
}

class ProductsAnimationInitial extends ProductsAnimationState{
  ProductsAnimationInitial(
      {
        super.titleLineWidth = 0,
        super.decorativeTitleContainerHeight = 0,
        super.sliderOffsetY = 1,
        super.sliderOpacity = 0,
        super.productItemOpacity = 0,
        super.backButtonOffsetX = -1,
        super.nextButtonOffsetX = 1
      }
      );
}

class ProductsAnimationStepOne extends  ProductsAnimationState{
  ProductsAnimationStepOne(
      {
        super.titleLineWidth = 100,
        super.decorativeTitleContainerHeight = LayoutDimensions.sectionTitleHeight * 2,
        super.sliderOffsetY = 0,
        super.sliderOpacity = 1,
        super.productItemOpacity = 0,
        super.backButtonOffsetX = -0.5,
        super.nextButtonOffsetX = 0.5
      }
      );
}

class ProductsAnimationStepTwo extends  ProductsAnimationState{
  ProductsAnimationStepTwo(
      {
        super.titleLineWidth = 100,
        super.decorativeTitleContainerHeight = LayoutDimensions.sectionTitleHeight * 2,
        super.sliderOffsetY = 0,
        super.sliderOpacity = 1,
        super.productItemOpacity = 1,
        super.backButtonOffsetX = 0,
        super.nextButtonOffsetX = 0
      }
      );
}