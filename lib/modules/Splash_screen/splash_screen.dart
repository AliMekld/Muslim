import 'package:flutter/material.dart';
import 'package:muslim/modules/Splash_screen/splash_controller.dart';
import 'package:muslim/utilites/helpers/theme_helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

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
    Future.delayed(Duration.zero).then((_) async => await con.getAllSurahs());
    print("From initState");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "بسم الله الرحمن الرحيم",
          style: TextStyleHelper.headerMedium34,
        ),
      ),
      body: ListView.builder(
        itemCount: con.surahs.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            title: Text(con.surahs[index].ayahs.fold("s", (c, p) => "$c $p"),style: TextStyleHelper.bodyMedium14,),
          );
        },
      ),
    );
  }
}
