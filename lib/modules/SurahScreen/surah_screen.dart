import 'package:flutter/material.dart';
import '../../utilites/helpers/theme_helper.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../Widgets/loading_widget.dart';
import 'surah_controller.dart';

class SurahScreen extends StatefulWidget {
  static const String routeName = "/surah";
  final int surahNumber;
  const SurahScreen({
    super.key,
    required this.surahNumber,
  });

  @override
  StateMVC<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends StateMVC<SurahScreen> {
  _SurahScreenState() : super(SurahController()) {
    con = SurahController();
  }
  late SurahController con;
  @override
  void initState() {
    super.initState();

    ///TODO : Get Surah By Number
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StretchingOverscrollIndicator(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          axisDirection: AxisDirection.down,
          child: LoadingWidget(
            isLoading: con.loading,
            child: CustomScrollView(slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                centerTitle: true,
                collapsedHeight: 60,
                expandedHeight: 80,
                title: Text(
                  "سوره الحاقة",
                  style: TextStyleHelper.of(context).headerMedium34.copyWith(height: 2),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
