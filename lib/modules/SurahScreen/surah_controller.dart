import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SurahController extends ControllerMVC {
  ///SingleTone
  static SurahController? _this;
  SurahController._();
  factory SurahController() => _this ??= SurahController._();
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

  bool loading = false;
}
