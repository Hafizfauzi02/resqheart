import 'package:flutter/material.dart';
import 'package:resqheart/pages/authentication/login.dart';
import 'package:resqheart/pages/authentication/signup.dart';
import 'package:resqheart/pages/bottomnav.dart';
import 'package:resqheart/pages/details/details1.dart';
import 'package:resqheart/pages/emergencycall/emergencycall.dart';
import 'package:resqheart/pages/home.dart';
import 'package:resqheart/pages/lifestyle/exercise/briskwalk.dart';
import 'package:resqheart/pages/lifestyle/lifestyle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
