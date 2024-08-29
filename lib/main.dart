import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/details_screen/details_screen.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/first_screen/first_screen.dart';
import 'package:movies_app/my_app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   await FirebaseFirestore.instance.enableNetwork();
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
        FirstScreen.routeName : (context) => FirstScreen(),
        DetailsScreen.routeName:(context) => DetailsScreen()
      },
      initialRoute: FirstScreen.routeName ,
      theme: MyAppTheme.appTheme,
    );
  }
}


