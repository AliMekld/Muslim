import 'package:flutter/cupertino.dart';
import 'package:muslim/models/surah_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'quran_data_handler.dart';

class QuranController extends ControllerMVC {
  ///SingleTone
  static QuranController? _this;
  QuranController._();
  factory QuranController() => _this ??= QuranController._();
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  dispose() {
    searchController.dispose();
    super.dispose();
  }
  void onSearch(String word ){
    setState(() {
      filterdList = surahs
          .where((e) =>
      e.name
          ?.replaceAll(RegExp(r'[^أ-ي ]'), '')
          .contains(word.replaceAll(
          RegExp(r'[^أ-ي ]'), '')) ??
          false)
          .toList();
    });
  }
  bool loading = false;
  List<SurahModel> surahs = [];
  List<SurahModel> filterdList = [];
  Future getAllSurahs() async {
    setState(() {
      loading = true;
    });
    final result = await QuranDataHandler.getAllSurahs();
    result.fold((l) {}, (r) {
      surahs = r;
      filterdList=surahs;
    });

    setState(() {
      loading = false;
    });
  }
}
