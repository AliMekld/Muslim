import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLocator {
 static GetIt locator =GetIt.instance;
  static Future<void> initLocator() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    locator.registerLazySingleton <SharedPreferences>(()=>prefs);
  }
}
