import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/core/theming/theme_helper.dart';
import 'package:muslim/generated/assets.dart';
import 'package:muslim/modules/HomeScreen/home_screen.dart';
import 'package:muslim/modules/QuranScreen/quran_screen.dart';
import 'package:muslim/utilites/extenstions.dart';

class MainLayoutWidget extends StatefulWidget {
  static const String routeName = 'mainLayout';
  const MainLayoutWidget({
    super.key,
    required this.path,
    required this.child,
  });
  final Widget child;
  final String path;

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///todo create a side bar when context != mobile
      bottomNavigationBar: context.isMobile
          ? BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
                context.go(_MenuList[currentIndex].route);
              },
              items: [
                  ..._MenuList.map(
                    (e) => BottomNavigationBarItem(
                      icon: SvgPicture.asset(e.img),
                      label: e.title,
                      backgroundColor: widget.path.contains(e.route)
                          ? ThemePalette.of(context).primaryColor
                          : ThemePalette.of(context).secondaryTextColor,
                    ),
                  )
                ])
          : null,
      body: widget.child,
    );
  }
}

List<MenuModel> get _MenuList => const [
      MenuModel(

          ///todo make vscode generate assets witout using any differant logic in code  and change those two images
          route: HomeScreen.routeName,
          img: Assets.imagesLogo,
          title: "Home"),
      MenuModel(
        route: QuranScreen.routeName,
        img: Assets.imagesLogo,
        title: "Quran",
      ),
    ];

class MenuModel {
  final String route;
  final String img;
  final String title;
  const MenuModel({
    required this.route,
    required this.img,
    required this.title,
  });
}
