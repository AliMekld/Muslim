import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/core/theming/theme_provider.dart';
import 'package:muslim/utilites/constants/constants.dart';
import 'package:muslim/utilites/get_it.dart';
import 'package:muslim/utilites/router_config.dart';
import 'package:provider/provider.dart';

/// TODO  : ============================>> INIT APP <<=====================================///
/// -> MVC PATTERN                    =>  MCV PACKAGE -- SINGLETON CLASS -- STATE MVC -- CONTROLLER MVC [done]
/// -> STATE MANAGEMENT               =>  PROVIDER
/// -> LOCAL STORAGE                  =>  SHARED PREFS
/// -> MULTI LANGUAGE SUPPORT         =>  I18N => INTEL > PROVIDER > SHARED PREFS
/// -> THEMING                        =>  THEME DATA    > PROVIDER > SHARED PREFS
/// -> DEPENDENCY INJECTION           =>  GET IT [done]
/// -> RESPONSIVE DESIGN              =>  SCREEN UTIL & LAYOUT BUILDER
/// -> ROUTING NAVIGATION HANDLER     =>  GO ROUTER
/// TODO : ============================>> CREATE SCREENS  <<=====================================///
/// -> NO DESIGN YET
/// TODO : ============================>> API INTEGRATION <<=====================================///
/// ->
/// TODO : =============================>> ADD APP LOGIC   <<=====================================///
/// -> QURAN READ / SOUND - ZEKR - AHADES - QEBLA - STORES FOR KIDS -ETC ...
/// TODO : ============================>> DEBUGGING / TESTING <<=====================================///
/// TODO : ============================>> RELEASING APP <<=====================================///
//-------------------------------------------------------------------------------------------------------------------------//

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetLocator.initLocator();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
    child: const EntryPoint(),
  ));
}

const Size largeSize = Size(1920, 1080);
const Size mediumSize = Size(1200, 1080);
const Size smallSize = Size(768, 1080);

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constants) {
      Size appSize;
      if (constants.maxWidth <= Constants.smallScreenMaxHeight) {
        appSize = largeSize;
      } else if (constants.maxWidth <= Constants.mediumScreenMaxHeight) {
        appSize = mediumSize;
      } else {
        appSize = largeSize;
      }
      return ScreenUtilInit(
        designSize: appSize,
        enableScaleText: () {
          return true;
        },
        child: Consumer<ThemeProvider>(builder: (context, theme, w) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            theme: theme.themeData.copyWith(
            
            ),
          );
        }),
      );
    });
  }
}
