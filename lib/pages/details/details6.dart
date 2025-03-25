import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resqheart/pages/bottomnav.dart';

import 'details2.dart';
class Details6 extends StatefulWidget {
  const Details6({super.key});

  @override
  State<Details6> createState() => _Details6State();
}

class _Details6State extends State<Details6> {
 

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        
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

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top:screenHeight *0.04, left: screenWidth * 0.25),
            child: Text(
              "LET'S GET STARTED",
              style: GoogleFonts.bebasNeue(fontSize: 35),
            ),
          ),
           Padding(
            padding:  EdgeInsets.only(top:screenHeight *0.02, left: screenWidth * 0.1 , right: screenWidth*0.1),
            child: Text(
              "Your heart is at the center of your well-being. Take a step toward a healthier, stronger you by prioritizing heart care. Small changes today lead to a lifetime of vitality and happiness.",
              style: GoogleFonts.montserrat(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: screenHeight*0.05)),
                Center(
        child: ClipOval(
          child: Image.asset(
            'assets/heart.jpeg', // Change to your actual asset path
            width: screenWidth * 0.7,  // Ensure it's a square to maintain circular shape
            height: screenWidth * 0.7, 
            fit: BoxFit.cover, // Ensures it fills the circular frame properly
          ),
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
              MaterialPageRoute(builder: (context) => Bottomnav()), // Fixed here
            );
          },
         child: Text(
      'GET STARTED',
      style: GoogleFonts.bebasNeue(
        fontSize: 25, // Adjust size if needed
        color: Colors.white,
      ),
    ),
       ),
       ),
        ],

      ),
    );
  }
}
