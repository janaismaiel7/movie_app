import 'package:flutter/material.dart';
import 'package:movies_app/details_screen/details_screen.dart';
import 'package:movies_app/first_screen/first_screen.dart';
import 'package:movies_app/my_app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false ,
      routes: {
        FirstScreen.routeName : (context) => FirstScreen(),
        DetailsScreen.routeName:(context) => DetailsScreen()
      },
      initialRoute: FirstScreen.routeName ,
      theme: MyAppTheme.appTheme,
    );
  }
}


