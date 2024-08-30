import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/first_screen/first_screen.dart';

class Splashscreen extends StatefulWidget {
static const routeName= 'splashScreen';
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),(){
Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (context) =>FirstScreen()));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: Image.asset('assets/images/splash.png',fit: BoxFit.cover,
        height: double.infinity ,width:  double.infinity,),
      ),
    );
  }
}