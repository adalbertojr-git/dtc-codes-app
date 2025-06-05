import 'package:dtc_harleys_app/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart';
import 'package:dtc_harleys_app/controllers/app.controller.dart';
import 'package:dtc_harleys_app/common/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppController.instance.loadTheme();
  setupLocator();
  runApp(const DTCHarleysApp());
}

class DTCHarleysApp extends StatelessWidget {
  const DTCHarleysApp({super.key});

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
      home: Loading(),
      builder: Asuka.builder,
      navigatorObservers: [
            Asuka.asukaHeroController
            //This line is needed for the Hero widget to work
          ],
      debugShowCheckedModeBanner: false,
    );
  }
}
