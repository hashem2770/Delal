import 'dart:developer';

import 'package:dalel/generated/assets.dart';
import 'package:dalel/utils/app_styles.dart';
import 'package:dalel/utils/routing/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:dalel/core/component/custom_button.dart';
import 'package:dalel/core/component/custom_text_button.dart';

class OnBoardingExploreView extends StatelessWidget {
  const OnBoardingExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    log('Explore On Boarding');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    onPressed: () {
                      context.goNamed(RoutesName.onBoardingAI);
                    },
                    label: 'Skip',
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SvgPicture.asset(
                Assets.imagesOnBoardingExploarHistory,
              ),
              const SizedBox(height: 62),
              buildTitleText(),
              const SizedBox(height: 16),
              buildDescText(),
              const SizedBox(height: 88),
              CustomButton(
                onPressed: () {
                  context.pushReplacementNamed(RoutesName.onBoardingHistorical);
                },
                label: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildDescText() {
    return const Text(
      'Using our app’s history libraries you can find many historical periods ',
      style: AppStyles.styleRegular16,
      textAlign: TextAlign.center,
    );
  }

  Text buildTitleText() {
    return const Text(
      'Explore The History With Dalel In A Smart Way',
      style: AppStyles.styleMedium24,
      textAlign: TextAlign.center,
    );
  }
}
