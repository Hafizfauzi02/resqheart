import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Logo
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

   
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    // Navigate to Feature Intro
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FeatureIntroScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.pink.shade50,
              Colors.pink.shade100,
            ], 
          ),
        ),
        child: Center(
          child: Icon(
            Icons.favorite,
            color: Colors.pinkAccent,
            size: 120,
          ),
        ),
      ),
    );
  }
}

// Feature Intro
class FeatureIntroScreen extends StatefulWidget {
  final int initialPage;
  FeatureIntroScreen({
    this.initialPage = 0,
  }); 

  @override
  _FeatureIntroScreenState createState() => _FeatureIntroScreenState();
}

class _FeatureIntroScreenState extends State<FeatureIntroScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  final List<Map<String, dynamic>> featurePages = [
    {
      "image": "assets/tracking icon.png",
      "title": "HEART HEALTH MONITORING & AI ANALYTICS",
    },
    {
      "image": "assets/emergency_icon.png",
      "title": "EMERGENCY RESPONSE & AI ALERTS",
    },
    {
      "image": "assets/chatbot_icon.png",
      "title": "SHARE, LEARN AND CONNECT THRU COMMUNITY & AI CHATBOT",
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
    _currentIndex = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.pink.shade50,
              Colors.pink.shade100,
            ], // Matches Let's Start Page
          ),
        ),
        child: Column(
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

            // Pagination Button
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Skip Button
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LetsStartScreen(),
                        ),
                      );
                    },
                    child: Text("SKIP", style: TextStyle(color: Colors.grey)),
                  ),

                
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
                              _currentIndex == index
                                  ? Colors.black
                                  : Colors.grey,
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LetsStartScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      _currentIndex == featurePages.length - 1
                          ? "FINISH"
                          : "NEXT",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String imagePath, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300, width: 300), 
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
    );
  }
}


class LetsStartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.pink.shade50,
              Colors.pink.shade100,
            ], 
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => FeatureIntroScreen(
                              initialPage: 2,
                            ), 
                      ),
                    );
                  },
                ),
              ),
            ),

            Spacer(),

            
            Icon(Icons.favorite, color: Colors.pinkAccent, size: 120),

            SizedBox(height: 20),

            
            Text(
              "RESQHEART",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),

            SizedBox(height: 10),

           
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Don't stress with the disease. \nWe'll guide you for the better lifestyle!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),

            Spacer(),


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
                  
                },
                child: Text(
                  "LET'S START",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
