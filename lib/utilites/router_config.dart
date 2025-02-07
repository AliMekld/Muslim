import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/modules/HomeScreen/home_screen.dart';
import 'package:muslim/modules/MainLayout/main_layout_widget.dart';
import 'package:muslim/modules/QuranScreen/quran_screen.dart';
import 'package:muslim/modules/SplashScreen/splash_screen.dart';

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
    ),
    ShellRoute(
        pageBuilder: (context, state, child) => _customTransitionPage(
              MainLayoutWidget(
                path: state.fullPath!,
                child: child,
              ),
              state,
            ),
        routes: [
          GoRoute(
            name: HomeScreen.routeName,
            path: HomeScreen.routeName,
            pageBuilder: (context, state) => _customTransitionPage(
              const HomeScreen(),
              state,
            ),
            routes: const [],
          ),

          /// Quran Screen
          GoRoute(
            name: QuranScreen.routeName,
            path: QuranScreen.routeName,
            pageBuilder: (context, state) => _customTransitionPage(
              const QuranScreen(),
              state,
            ),
            routes: const [],
          ),
        ]),
  ],
);

CustomTransitionPage<GoRouterState> _customTransitionPage(
    Widget child, GoRouterState state) {
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
