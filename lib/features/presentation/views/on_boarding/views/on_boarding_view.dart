import 'package:dalel/features/presentation/views/on_boarding/models/on_boarding_model.dart';
import 'package:dalel/generated/assets.dart';
import 'package:dalel/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: OnBoardingModel.list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Skip',
                          style: AppStyles.styleRegular16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.imagesOnBoardingExploarHistory,
                  ),
                  const SizedBox(
                    height: 62,
                  ),
                  const Text(
                    'Explore The History With Dalel In A Smart Way',
                    style: AppStyles.styleMedium24,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Using our app’s history libraries you can find many historical periods ',
                    style: AppStyles.styleRegular16,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 88,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48,
                    color: const Color(0xffC49E85),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Next',
                        style: AppStyles.styleMedium16
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
