import 'package:flutter/material.dart';
import 'package:resqheart/pages/chatbot/chatbot.dart';
import 'package:resqheart/pages/community/community.dart';
import 'package:resqheart/pages/onboarding/onboarding1.dart';

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
      home: ChatbotScreen(),
    );
  }
}
