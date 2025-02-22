import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim/Widgets/custom_text_field_widget.dart';
import 'package:muslim/core/language/app_delegate.dart';
import 'package:muslim/core/theming/theme_helper.dart';
import 'package:muslim/models/surah_model.dart';
import 'package:muslim/modules/QuranScreen/quran_controller.dart';
import 'package:muslim/utilites/constants/assets.dart';
import 'package:muslim/utilites/constants/constants.dart';
import 'package:muslim/utilites/helpers/theme_helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Widgets/loading_widget.dart';

class QuranScreen extends StatefulWidget {
  static const String routeName = "/quran";
  const QuranScreen({super.key});

  @override
  StateMVC<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends StateMVC<QuranScreen> {
  _QuranScreenState() : super(QuranController()) {
    con = QuranController();
  }
  late QuranController con;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async => await con.getAllSurahs());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemePalette.of(context).backgroundColor,
        body: StretchingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          child: LoadingWidget(
            isLoading: con.loading,
            child: CustomScrollView(slivers: [
              SliverAppBar(
                backgroundColor: ThemePalette.of(context).buttonDisabledColor,
                floating: true,
                centerTitle: true,
                collapsedHeight: 60,
                expandedHeight: 60,
                title: Text(
                  "القــــران",
                  style: TextStyleHelper.of(context)
                      .headerMedium34
                      .copyWith(height: 2),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                // floating: true,
                delegate: MySliverPersistentHeaderDelegate(
                  con: con,
                  maxExtent: 80.0,
                  minExtent: 80.0,
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: con.filterdList.length,
                (context, index) {
                  return SurahContainer(surah: con.filterdList[index]);
                },
              )),
            ]),
          ),
        ),
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
      onTap: () {
        // context.pushNamed(SurahScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
            color: ThemePalette.of(context).surfaceColor,
            borderRadius: BorderRadius.circular(16)),
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
              SizedBox(
                height: 40,
                width: 40,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      Assets.imagesNumberContainer,
                      height: 48,
                      width: 48,
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        surah.number?.toString() ?? "",
                        style: TextStyleHelper.of(context).bodyMedium14,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                (isArabic(context) ? surah.name : surah.englishName) ?? "",
                style: TextStyleHelper.of(context).headerSmall24,
              ),
              Text(
                surah.revelationType?.tr ?? "",
                style: TextStyleHelper.of(context).headerSmall24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  final double minExtent;
  @override
  final double maxExtent;
  final QuranController con;

  const MySliverPersistentHeaderDelegate({
    required this.minExtent,
    required this.maxExtent,
    required this.con,
  });

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false; // Can be customized based on your needs
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: ThemePalette.of(context).surfaceColor,
      height: 80,
      constraints: BoxConstraints(maxHeight: maxExtent, minHeight: minExtent),
      padding: const EdgeInsets.all(16),
      child: CustomTextFieldWidget(
        lableText: "بحــــث",
        controller: con.searchController,
        onChanged: (_) => con.onSearch(_!),
      ),
    );
  }
}
