import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/modules/HomeScreen/home_screen.dart';
import 'package:muslim/modules/SplashScreen/splash_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../utilites/constants/assets.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";
  const SplashScreen({super.key});

  @override
  StateMVC<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  _SplashScreenState() : super(SplashController()) {
    con = SplashController();
  }
  late SplashController con;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        context.goNamed(HomeScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.imagesLogo),
      ),
    );
  }
}
