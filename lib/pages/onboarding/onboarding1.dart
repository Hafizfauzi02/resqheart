import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();

    // Make status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    // Show splash screen for 2 seconds, then switch to onboarding
    Timer(Duration(seconds: 2), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showSplash ? _buildSplashScreen() : _buildOnboardingScreen(),
    );
  }

  // Splash Screen (Shows for 2 seconds)
  Widget _buildSplashScreen() {
    return Center(
      child: Image.asset(
        "assets/logo.png", // Replace with your actual logo image
        width: 150,
        height: 150,
      ),
    );
  }

  // Onboarding Screen (After 2 Seconds)
  Widget _buildOnboardingScreen() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.pink.shade50, Colors.pink.shade100],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),

          // Big Pink Heart
          Icon(Icons.favorite, color: Colors.pinkAccent, size: 120),

          SizedBox(height: 20),

          // Title: "RESQHEART"
          Text(
            "RESQHEART",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),

          SizedBox(height: 10),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Don't stress with the disease. \nWe'll guide you for the better lifestyle!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),

          Spacer(),

          // "LET'S START" Button
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FeatureIntroScreen()),
                );
              },
              child: Text(
                "LET'S START",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 3️⃣ Feature Introduction Screens (PageView)
class FeatureIntroScreen extends StatefulWidget {
  @override
  _FeatureIntroScreenState createState() => _FeatureIntroScreenState();
}

class _FeatureIntroScreenState extends State<FeatureIntroScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> featurePages = [
    {
      "image": "assets/heart_monitor.png", // Replace with actual image path
      "title": "HEART HEALTH MONITORING & AI ANALYTICS",
    },
    {
      "image": "assets/emergency_call.png",
      "title": "EMERGENCY RESPONSE & AI ALERTS",
    },
    {
      "image": "assets/chatbot.png",
      "title": "SHARE, LEARN AND CONNECT THRU COMMUNITY & AI CHATBOT",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: featurePages.length,
              itemBuilder: (context, index) {
                return _buildPage(
                  featurePages[index]["image"],
                  featurePages[index]["title"],
                );
              },
            ),
          ),

          // Pagination Dots & Navigation Buttons
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Skip Button
                TextButton(
                  onPressed: () {
                    // Navigate to main app
                  },
                  child: Text("SKIP", style: TextStyle(color: Colors.grey)),
                ),

                // Dots Indicator
                Row(
                  children: List.generate(
                    featurePages.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentIndex == index ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),

                // Next Button
                TextButton(
                  onPressed: () {
                    if (_currentIndex < featurePages.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Navigate to main app
                    }
                  },
                  child: Text("NEXT", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String imagePath, String title) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.amber.shade50],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 150, width: 150),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
