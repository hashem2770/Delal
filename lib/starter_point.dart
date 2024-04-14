import 'dart:developer';

import 'package:dalel/features/presentation/views/on_boarding/views/on_boarding_explore_view.dart';
import 'package:flutter/material.dart';

class StarterPoint extends StatelessWidget {
  const StarterPoint({super.key});

  @override
  Widget build(BuildContext context) {
    log('StarterPoint');
    return const OnBoardingExploreView();
  }
}
