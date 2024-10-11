import 'package:flutter/cupertino.dart';
import 'package:muslim/modules/QuranScreen/quran_screen.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeController extends ControllerMVC {
  ///SingleTone
  static HomeController? _this;
  HomeController._();
  factory HomeController() => _this ??= HomeController._();
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
  SystemBrightness brightness = SystemBrightness.dark;
  List<CardModel> cardList = [
    CardModel(name: "azkar", path: "", img: ""),
    CardModel(name: "quran", path: QuranScreen.routeName, img: ""),
    CardModel(name: "ahades", path: "", img: ""),
    CardModel(name: "stories", path: "", img: ""),
  ];
}

class CardModel {
  final String name;
  final String img;
  final String path;
  CardModel({
    required this.name,
    required this.img,
    required this.path,
  });
}

enum SystemBrightness {
  dark,
  light;

  static List<SystemBrightness> get list => [
        SystemBrightness.dark,
        SystemBrightness.light,
      ];
}
