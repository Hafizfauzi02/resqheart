import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resqheart/main.dart';
import 'package:resqheart/pages/bottomnav.dart';
import 'package:resqheart/pages/home.dart';
import 'package:resqheart/pages/details/details1.dart';
import 'package:resqheart/pages/heartrate/heartrate3.dart';
import 'heartrate2.dart';

class Heartrate extends StatefulWidget {
  const Heartrate({super.key});

  @override
  State<Heartrate> createState() => _HeartrateState();
}

class _HeartrateState extends State<Heartrate> {
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
                            '76 BPM',
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
                        color: Color.fromARGB(233, 65, 182, 44),
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
                            '76 BPM',
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
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
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
                                      color: Colors.green,
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
                                      color: Colors.white,
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
                                Padding(padding: EdgeInsets.only(top: screenHeight * 0.02)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Circular Date Container
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.green, width: 6),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "16/3/2025",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.01),

                                    // Analysis Text
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Result Analysis",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "Heart Rate: Normal",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "ECG Analysis:",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Normal Sinus Rhythm",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              decoration: TextDecoration.underline,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
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
                                  builder: (context) => DateDetailsPage(date: selectedDate),
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
      
    );
  }
}
