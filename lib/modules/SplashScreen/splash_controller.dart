import 'package:mvc_pattern/mvc_pattern.dart';

class SplashController extends ControllerMVC {
  ///SingleTone
  //singleTone
  static SplashController? _this;
  SplashController._();
  factory SplashController() => _this ??= SplashController._();
  bool loading = false;
}
