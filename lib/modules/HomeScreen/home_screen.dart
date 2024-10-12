import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/core/theming/theme_helper.dart';
import 'package:muslim/core/theming/theme_provider.dart';
import 'package:muslim/models/surah_model.dart';
import 'package:muslim/utilites/constants/constants.dart';
import 'package:muslim/utilites/extenstions.dart';
import 'package:muslim/utilites/helpers/theme_helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:provider/provider.dart';

import '../../Widgets/custom_radio_widget.dart';
import '../../Widgets/loading_widget.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  StateMVC<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme=Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:ThemePalette.of(context).backgroundColor,
        body: StretchingOverscrollIndicator(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          axisDirection: AxisDirection.down,
          child: LoadingWidget(
            isLoading: con.loading,
            child: CustomScrollView(slivers: [
              SliverAppBar(
                backgroundColor:ThemePalette.of(context).surfaceColor,
                floating: true,
                centerTitle: true,
                collapsedHeight: 60,
                expandedHeight: 80,
                title: Row(
                  children: [
                    Text(
                      "مســـــــــلم",
                      style: TextStyleHelper.of(context).headerMedium34.copyWith(height: 2),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: 32.0.heightBox,
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CustomCardWidget(item: con.cardList[index]);
                  },
                  childCount: con.cardList.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 16,
                  mainAxisExtent: 160,
                  crossAxisCount: 2,
                  // childAspectRatio: 16 / 9,
                  mainAxisSpacing: 16,
                ),
              ),
              24.0.heightBox.toSliver,
              CustomListRadioWidget<SystemBrightness>.wrap(
                isButton: true,
                groupValue: Provider.of<ThemeProvider>(context).appTheme.isDark==true?SystemBrightness.dark:SystemBrightness.light,
                itemsList: SystemBrightness.list,
                onChanged: (_) {
                  setState(() {
                    con.brightness = _!;
                  });
                  theme.changeTheme(con.brightness);
                  print(con.brightness);
                },
              ).toSliver,
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.item,
  });

  final CardModel item;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(8),
      elevation: 4,
      minWidth: 20,
      hoverElevation: 16,
      enableFeedback: true,
      height: 48,
      shape: RoundedRectangleBorder(borderRadius: Constants.kBorderRadius16),
      color:ThemePalette.of(context).surfaceColor,
      onPressed: () {
        if (item.path.isEmpty) return;
        context.pushNamed(item.path);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            item.img,
            width: 120.w,
            height: 120.h,
          ),
          8.h.heightBox,
          Text(
            item.name,
            style: TextStyleHelper.of(context).headerSmall24,
          ),
        ],
      ),
    );
  }
}

class SurahContainer extends StatelessWidget {
  const SurahContainer({
    super.key,
    required this.surah,
  });

  final SurahModel surah;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: Constants.kBorderRadius16,
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color:ThemePalette.of(context).surfaceColor, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(4),
        height: 80,
        width: 1.sw,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                surah.name ?? "",
                style: TextStyleHelper.of(context).headerSmall24,
              ),
              Text(
                surah.revelationType ?? "",
                style: TextStyleHelper.of(context).headerSmall24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
