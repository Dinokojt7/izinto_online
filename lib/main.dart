import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/Home/main_specialty_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarBrightness: Brightness.dark, //status bar brigtness
    statusBarIconBrightness: Brightness.dark,
    //   systemNavigationBarIconBrightness:
    //       Brightness.dark, //status barIcon Brightness
    //   //   //systemNavigationBarDividerColor:
    //   //   //  Colors.brown[100], //Navigation bar divider color
    //   //   // systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainSpecialtyPage());
  }
}
