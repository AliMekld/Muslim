import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/modules/Splash_screen/splash_screen.dart';

GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
GoRouter get router => _router;
GoRouter _router = GoRouter(
  initialLocation: "/",
  navigatorKey: _navigationKey,
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      name: SplashScreen.routeName,
      pageBuilder: (context, state) => _customTransitionPage(
        const SplashScreen(),
        state,
      ),
      routes: const [],
    ),
  ],
);

CustomTransitionPage<GoRouterState> _customTransitionPage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, anm1, anm2, w) {
      return FadeTransition(
        opacity: anm1,
        child: child,
      );
    },
  );
}
