import 'package:flutter/cupertino.dart';
import 'package:muslim/core/language/app_delegate.dart';
import 'package:muslim/modules/QuranScreen/quran_screen.dart';
import 'package:muslim/utilites/constants/assets.dart';
import 'package:muslim/utilites/constants/strings.dart';
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

  List<CardModel> cardList = [
    CardModel(
      name: Strings.azkar.tr,
      path: "",
      img: Assets.imagesAzkar,
    ),
    CardModel(
      name: Strings.quran.tr,
      path: QuranScreen.routeName,
      img: Assets.imagesQuarn2,
    ),
    CardModel(
      name: Strings.ahades.tr,
      path: "",
      img: Assets.imagesAhades,
    ),
    CardModel(
      name: Strings.doaa.tr,
      path: "",
      img: Assets.imagesDoaa,
    ),
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
