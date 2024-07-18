import 'package:flutter/material.dart';

/// TODO  : ============================>> INIT APP <<=====================================///
/// -> MVC PATTERN                    =>  MCV PACKAGE -- SINGLETON CLASS -- STATE MVC -- CONTROLLER MVC
/// -> STATE MANAGEMENT               =>  PROVIDER
/// -> LOCAL STORAGE                  =>  SHARED PREFS
/// -> MULTI LANGUAGE SUPPORT         =>  I18N => INTEL > PROVIDER > SHARED PREFS
/// -> THEMING                        =>  THEME DATA    > PROVIDER > SHARED PREFS
/// -> DEPENDENCY INJECTION           =>  GET IT
/// -> RESPONSIVE DESIGN              =>  SCREEN UTIL & LAYOUT BUILDER
/// -> ROUTING NAVIGATION HANDLER     =>  GO ROUTER
/// TODO : ============================>> CREATE SCREENS  <<=====================================///
/// -> NO DESIGN YET
/// TODO : ============================>> API INTEGRATION <<=====================================///
/// ->
/// TODO : =============================>> ADD APP LOGIC   <<=====================================///
/// -> QURAN READ / SOUND - ZEKR - AHADES - QEBLA - STORES FOR KIDS -ETC ...
/// TODO : ============================>> DEBUGGING / TESTING <<=====================================///
/// TODO : ============================>> RELEASING APP <<=====================================///
//-------------------------------------------------------------------------------------------------------------------------//


void main() {
  runApp(const EntryPoint());
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
