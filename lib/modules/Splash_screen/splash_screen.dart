import 'package:flutter/material.dart';
import 'package:muslim/modules/Splash_screen/splash_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  StateMVC<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends StateMVC<SplashScreen> {
  _SplashScreenState() : super(SplashController()) {
    con = SplashController();
  }
  late SplashController con;
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
