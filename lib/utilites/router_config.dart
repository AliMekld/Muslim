import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
GoRouter get router => _router;
GoRouter _router = GoRouter(
  initialLocation: "/",
  navigatorKey: _navigationKey,
  routes: [


  ],
);
