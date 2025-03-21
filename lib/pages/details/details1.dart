import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resqheart/pages/details/details2.dart';

import '../../details2.dart'; // Import the Details1 page
class Details1 extends StatefulWidget {
  const Details1({super.key});

  @override
  State<Details1> createState() => _Details1State();
}

class _Details1State extends State<Details1> {
  int selectedAge = 27; // Default selected age
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(initialItem: selectedAge);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight *0.02),
          child: IconButton(
            icon:  Icon(Icons.arrow_back_ios, size:screenWidth * 0.08 ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(top:screenHeight *0.02, left: screenWidth * 0.09),
                child: Text(
                  'Step 1 of 5',
                  style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top:screenHeight *0.01, left: screenWidth * 0.09),
                child: Text(
                  'HOW OLD ARE YOU?',
                  style: GoogleFonts.bebasNeue(fontSize: 40),
                ),
              ),
              
              Center(
                
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: screenHeight*0.05 , left: screenWidth *0.01 ), 
                      //  Scrollable Number Picker
                      child:SizedBox(
              height: screenHeight *0.45, // Controls how many numbers are visible (adjustable)
              child:ListWheelScrollView.useDelegate(
                        controller: _controller,
                        itemExtent: 80, // Adjusts spacing
                        physics: const FixedExtentScrollPhysics(parent: ClampingScrollPhysics()), // Slows down scrolling
                        perspective: 0.005, // Slight 3D effect
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedAge = index;
                          });
                       
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            if (index < 0 || index >= 101) return const SizedBox(); 
                            return Center(
                              child: Text(
                                index.toString(),
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                          childCount: 101, // Numbers 0-100
                        ),
                      ),
                      ),
                      ),
                      
                      
                      // 🔲 Fixed Black Box in Center
                      Positioned(
                        top: screenHeight *0.25, // Adjust position to match the middle
                        child: Container(
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.08, // Same as itemExtent
                          decoration: BoxDecoration(
                            color: Colors.black, // Semi-transparent
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            selectedAge.toString(),
                            style: GoogleFonts.bebasNeue(
                              fontSize: 32,
                            
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
           Padding(padding: EdgeInsets.only(top:screenHeight *0.1 , left:screenWidth *0.1), 
           child:  ElevatedButton(
              
            style: ElevatedButton.styleFrom(
                 backgroundColor: Color(0xFF364FF5), // Correct blue color // Change color as needed
          padding:  EdgeInsets.symmetric(horizontal: screenWidth* 0.3, vertical: screenHeight * 0.025), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
            ),
            
            
              onPressed: () {
                // Navigate to Details1 page when button is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Details2()), // Fixed here
                );
              },
             child: Text(
          'NEXT STEPS',
          style: GoogleFonts.bebasNeue(
            fontSize: 25, // Adjust size if needed
            color: Colors.white,
          ),
              ),
           ),
           ),
            ],
          
          ),
        ),
      ),
    );
  }
}
