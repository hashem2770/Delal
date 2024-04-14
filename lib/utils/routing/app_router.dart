import 'package:dalel/features/presentation/views/auth/views/signup_view.dart';
import 'package:dalel/features/presentation/views/on_boarding/views/on_boarding_ai_view.dart';
import 'package:dalel/features/presentation/views/on_boarding/views/on_boarding_explore_view.dart';
import 'package:dalel/features/presentation/views/on_boarding/views/on_boarding_historical_view.dart';
import 'package:dalel/starter_point.dart';
import 'package:dalel/utils/routing/routes_name.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        name: RoutesName.starterPoint,
        builder: (context, state) => const StarterPoint(),
        routes: [
          GoRoute(
            path: 'onBoardingExplore',
            name: RoutesName.onBoardingExplore,
            builder: (context, state) => const OnBoardingExploreView(),
          ),
          GoRoute(
            path: 'onBoardingAI',
            name: RoutesName.onBoardingAI,
            builder: (context, state) => const OnBoardingAIView(),
          ),
          GoRoute(
            path: 'onBoardingHistorical',
            name: RoutesName.onBoardingHistorical,
            builder: (context, state) => const OnBoardingHistoricalView(),
          ),
        ]),
    GoRoute(
      path: '/signUp',
      name:  RoutesName.signUpView,
      builder: (context, state) => const SignUpView(),
    ),
  ],
);
