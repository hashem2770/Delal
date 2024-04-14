import 'dart:developer';

import 'package:dalel/core/component/custom_button.dart';
import 'package:dalel/core/component/custom_text_button.dart';
import 'package:dalel/generated/assets.dart';
import 'package:dalel/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingAIView extends StatelessWidget {
  const OnBoardingAIView({super.key});

  @override
  Widget build(BuildContext context) {
    log('Ai On Boarding');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              SvgPicture.asset(
                Assets.imagesOnBoardingAi,
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
                  //todo: go to create account
                },
                label: 'Create Account ',
              ),
              const SizedBox(height: 16),
              CustomTextButton(
                onPressed: () {
                  //todo: go to login
                },
                label: 'Login Now',
              )
            ],
          ),
        ),
      ),
    );
  }

  Text buildDescText() {
    return const Text(
              'AI provide recommendations and helps you to continue the search journey',
              style: AppStyles.styleRegular16,
              textAlign: TextAlign.center,
            );
  }

  Text buildTitleText() {
    return const Text(
              'Using Modern AI Technology for better user experience',
              style: AppStyles.styleMedium24,
              textAlign: TextAlign.center,
            );
  }
}
