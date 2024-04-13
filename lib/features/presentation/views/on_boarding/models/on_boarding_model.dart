import 'package:dalel/generated/assets.dart';

class OnBoardingModel {
  final String headline;
  final String description;
  final String image;

  OnBoardingModel({
    required this.headline,
    required this.description,
    required this.image,
  });

  static List<OnBoardingModel> list = [
    OnBoardingModel(
      headline: "Explore The history with Dalel in a smart way",
      description: "Using our app’s history libraries you can find many historical periods ",
      image: Assets.imagesOnBoardingExploarHistory,
    ),

    OnBoardingModel(
      headline: "From every place on earth",
      description: "A big variety of ancient places from all over the world",
      image: Assets.imagesOnBoardingTakingSelfie,
    ),

    OnBoardingModel(
      headline: "Using modern AI technology for better user experience",
      description: "AI provide recommendations and helps you to continue the search journey",
      image: Assets.imagesOnBoardingAi,
    ),
  ];
}
