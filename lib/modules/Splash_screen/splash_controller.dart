import 'package:muslim/models/surah_model.dart';
import 'package:muslim/modules/Splash_screen/splash_data_handler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashController extends ControllerMVC {
  ///SingleTone
  //singleTone
  static SplashController? _this;
  SplashController._();
  factory SplashController() => _this ??= SplashController._();
  bool loading = false;
  List<SurahModel> surahs = [];
  Future getAllSurahs() async {
    final result = await SplashDataHandler.getAllSurahs();
    result.fold((l) {
      print(l);
    }, (r) {
      surahs = r;
    });
  }
}
