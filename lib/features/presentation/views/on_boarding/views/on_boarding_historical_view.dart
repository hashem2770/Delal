import 'dart:developer';

import 'package:dalel/core/component/custom_button.dart';
import 'package:dalel/core/component/custom_text_button.dart';
import 'package:dalel/generated/assets.dart';
import 'package:dalel/utils/app_styles.dart';
import 'package:dalel/utils/routing/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnBoardingHistoricalView extends StatelessWidget {
  const OnBoardingHistoricalView({super.key});

  @override
  Widget build(BuildContext context) {
    log('Historical On Boarding');
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
              const SizedBox(
                height: 32,
              ),
              SvgPicture.asset(
                Assets.imagesOnBoardingTakingSelfie,
              ),
              const SizedBox(
                height: 62,
              ),
              buildTitleText(),
              const SizedBox(
                height: 16,
              ),
              buildDescText(),
              const SizedBox(
                height: 88,
              ),
              CustomButton(
                onPressed: () {
                  context.pushReplacementNamed(RoutesName.onBoardingAI);
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
              'A big variety of ancient places from all over the world',
              style: AppStyles.styleRegular16,
              textAlign: TextAlign.center,
            );
  }

  Text buildTitleText() {
    return const Text(
              'Form Every Place On Earth',
              style: AppStyles.styleMedium24,
              textAlign: TextAlign.center,
            );
  }
}
