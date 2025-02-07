import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/core/language/app_delegate.dart';
import 'package:muslim/core/language/language_provider.dart';
import 'package:muslim/core/theming/theme_provider.dart';
import 'package:muslim/utilites/constants/constants.dart';
import 'package:muslim/utilites/get_it.dart';
import 'package:muslim/utilites/router_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// this line for removing [#] in web
  if (kIsWeb) {
    usePathUrlStrategy();
  }
  await GetLocator.initLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
    ],
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
    final appLang = Provider.of<LanguageProvider>(context);
    final appTheme = Provider.of<ThemeProvider>(context);

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
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: appTheme.themeData,
          locale: appLang.appLang,
          supportedLocales: Languages.values.map((e) => Locale(e.name)),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      );
    });
  }
}
