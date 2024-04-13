import 'package:dalel/features/presentation/views/on_boarding/models/on_boarding_model.dart';
import 'package:dalel/generated/assets.dart';
import 'package:dalel/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: OnBoardingModel.list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Skip',
                        style: AppStyles.styleRegular16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Image.asset(Assets.imagesOnBoardingExploarHistory),
              ],
            ),
          );
        },
      ),
    );
  }
}
