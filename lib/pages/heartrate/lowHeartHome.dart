import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resqheart/main.dart';
import 'package:resqheart/pages/bottomnav.dart';
import 'package:resqheart/pages/heartrate/highRate.dart';
import 'package:resqheart/pages/heartrate/lowRate.dart';
import 'package:resqheart/pages/home.dart';
import 'package:resqheart/pages/details/details1.dart';
import 'package:resqheart/pages/heartrate/heartrate3.dart';
import 'heartrate2.dart';

class Lowhearthome extends StatefulWidget {
  const Lowhearthome({super.key});

  @override
  State<Lowhearthome> createState() => _LowHeartHomeState();
}

class _LowHeartHomeState extends State<Lowhearthome> {

  int _selectedIndex = 2; // ✅ Set to 2 to highlight the Heart tab

  // ✅ Move _pages list here (class-level)
  final List<Widget> _pages = [
    Bottomnav(initialIndex: 0,),
    Bottomnav(initialIndex: 1,),
    Bottomnav(initialIndex: 2,), // Main Heart Rate Page
    Bottomnav(initialIndex: 3,),
    Bottomnav(initialIndex: 4,),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "HEART RATE",
          style: GoogleFonts.kronaOne(fontSize: 32, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.05),
              Center(
                child: Column(
                  children: [
                    // First Container (Heart Rate Box)
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.redAccent, Colors.pink],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Resting Heart Rate',
                            style: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            '52 BPM',
                            style: GoogleFonts.bebasNeue(fontSize: 40),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text("16/03/2025 17:05"),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),

                    // Second Container (Score Box + Analysis)
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: screenWidth * 0.8,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(233, 255, 164, 27),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            'Score',
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            '52 BPM',
                            style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white),
                          ),
                          SizedBox(height: screenHeight * 0.02),

                          // Row with three rectangles + labels
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color:const Color.fromARGB(255, 255, 132, 0),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.white,width: 2)
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "LOW",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.white ,width: 2)
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "NORMAL",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                        
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.white ,width: 2)
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "HIGH",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),

                          // "Last Scanned" Section Inside Second Container
                          Container(
                            width: screenWidth * 0.7,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.white ,width: 2)
                            ),
                            child: Column(
                              children: [
                                 Text(
          "Last Scanned",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color:const Color.fromARGB(255, 255, 132, 0), width: 6),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "16/3/2025", // Display dynamic date
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Result Analysis",
                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  "Heart Rate: Low",
                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                SizedBox(height: 5),
                Text(
                  "ECG Analysis:",
                  style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Bradycardia Detected",
                  style: GoogleFonts.montserrat(fontSize: 14, decoration: TextDecoration.underline, color: Colors.black, fontWeight: FontWeight.w500),
                ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              DateTime selectedDate = DateTime(2025, 3, 16); // Example: Replace with dynamic date if needed
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DateDetailsPage2(date: selectedDate),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(padding: EdgeInsets.only(right: screenWidth * 0.5)),
                                Text(
                                  "MORE",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF364FF5),
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.025),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Heartrate3()),
                        );
                      },
                      child: Text(
                        'Start Scanning',
                        style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: screenHeight * 0.04)),

                    Container(
                      width: screenWidth * 0.8,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(68, 52, 131, 210),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "Heart Rate Trend past 7 days",
                                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => Heartrate2()), // Navigate to Details1
                                  );
                                },
                                child: Text(
                                  "📅", // Emoji as a clickable button
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Image.asset(
                            'assets/graph.png',
                            width: screenWidth * 0.995,
                            height: screenHeight * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: screenHeight * 0.15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
        // ✅ Bottom Navigation Bar with ALL Icons
    bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex, // 👈 Highlights the Heart icon
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          if (index != _selectedIndex) {
            // ✅ Prevents unnecessary reload when tapping the same tab
            setState(() {
              _selectedIndex = index;
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => _pages[index]), // ✅ Fixed: _pages is now accessible
            );
          }
        },
        items: [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.public, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white), // ❤️ Heart tab
          Icon(Icons.call, color: Colors.white),
          Icon(Icons.self_improvement, color: Colors.white),
        ],
      ),
    );
  }
}
    
