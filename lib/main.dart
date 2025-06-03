import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart';
import 'package:dtc_harley_codes/controllers/app.controller.dart';
import 'package:dtc_harley_codes/pages/dtc.code.dashboard.page.dart';
import 'package:dtc_harley_codes/common/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppController.instance.loadTheme();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harley DTC Codes',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.deepOrange[300],
        ),
        //bottomAppBarColor: Colors.deepOrange[300],
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: AppController.instance.isDarkTheme
            ? Brightness.dark
            : Brightness.light,
      ),
      home: DtcCodeDashboardPage(),
      builder: Asuka.builder,
      navigatorObservers: [
            Asuka.asukaHeroController
            //This line is needed for the Hero widget to work
          ],
      debugShowCheckedModeBanner: false,
    );
  }
}
