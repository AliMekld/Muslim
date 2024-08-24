import 'package:flutter/material.dart';
import '../../utilites/constants/constants.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ResponsiveConfig extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveConfig({
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= Constants.smallScreenMaxHeight) {
        return smallScreen;
      } else if (constraints.maxWidth <= Constants.mediumScreenMaxHeight &&
          constraints.minWidth > Constants.smallScreenMaxHeight) {
        return mediumScreen;
      } else {
        return largeScreen;
      }
    });
  }
}

abstract class StatelessResponsiveConfig extends StatelessWidget {
  Widget buildLargeScreen(BuildContext context);
  Widget buildMediumScreen(BuildContext context);
  Widget buildSmallScreen(BuildContext context);
  const StatelessResponsiveConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveConfig(
      largeScreen: buildLargeScreen(context),
      mediumScreen: buildMediumScreen(context),
      smallScreen: buildSmallScreen(context),
    );
  }
}

abstract class ResponsiveStateFullConfig extends StatefulWidget {
  const ResponsiveStateFullConfig({super.key});
}

abstract class ResponsiveStateFullConfigState<T extends StatefulWidget>
    extends StateMVC<T> {
  ResponsiveStateFullConfigState(super._controller);
  Widget buildLargeScreen(BuildContext context);
  Widget buildMediumScreen(BuildContext context);
  Widget buildSmallScreen(BuildContext context);
  @override
  Widget build(BuildContext context) {
    return ResponsiveConfig(
        largeScreen: buildLargeScreen(context),
        mediumScreen: buildMediumScreen(context),
        smallScreen: buildSmallScreen(context));
  }
}
