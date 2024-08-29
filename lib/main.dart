import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/first_screen/first_screen.dart';
import 'package:movies_app/my_app_theme.dart';
import 'package:movies_app/splashScreen/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false ,
      routes: {
        Splashscreen.routeName : (context) => Splashscreen()
      },
      initialRoute: Splashscreen.routeName ,
      theme: MyAppTheme.appTheme,
    );
  }
}


