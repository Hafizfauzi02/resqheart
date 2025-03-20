import 'package:flutter/material.dart';
import 'dart:async';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Show logo for 2 seconds before navigating to the onboarding page
    Timer(Duration(seconds: 2), () {
      setState(() {
        _currentIndex = 1;
      });
    });
  }

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to ResQHeart",
      "description":
          "Don't stress with the disease. We'll guide you for the better lifestyle!",
      "buttonText": "LET'S START",
    },
    {
      "title": "Heart Health Monitoring & AI Analytics",
      "image": "assets/heart_monitor.png",
    },
    {
      "title": "Emergency Response & AI Alerts",
      "image": "assets/emergency_call.png",
    },
    {
      "title": "Share, Learn and Connect Thru Community & AI Chatbot",
      "image": "assets/chatbot.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            _currentIndex == 0
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Placeholder(fallbackHeight: 100, fallbackWidth: 100),
                      SizedBox(height: 20),
                      Text(
                        "Loading...",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (onboardingData[_currentIndex - 1]["image"] != null)
                      Image.asset(
                        onboardingData[_currentIndex - 1]["image"]!,
                        height: 150,
                      ),
                    SizedBox(height: 20),
                    Text(
                      onboardingData[_currentIndex - 1]["title"]!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (onboardingData[_currentIndex - 1]["description"] !=
                        null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          onboardingData[_currentIndex - 1]["description"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _currentIndex - 1 == index
                                    ? Colors.black
                                    : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_currentIndex > 1)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _currentIndex = 1;
                                });
                              },
                              child: Text(
                                "SKIP",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_currentIndex < onboardingData.length) {
                                  _currentIndex++;
                                } else {
                                  // Navigate to Home Screen
                                }
                              });
                            },
                            child: Text(
                              _currentIndex == 1
                                  ? onboardingData[_currentIndex -
                                      1]["buttonText"]!
                                  : "NEXT",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
      ),
    );
  }
}
