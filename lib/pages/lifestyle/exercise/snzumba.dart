import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:resqheart/pages/lifestyle/exercise/mainexercise.dart';

class Snzumba extends StatefulWidget {
  const Snzumba({super.key});

  @override
  State<Snzumba> createState() => _SnzumbaState();
}

class _SnzumbaState extends State<Snzumba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Image
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ex2.png'), // Replace with actual image
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),

          // Exercise Info
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Exercise 1/3", style: TextStyle(color: Colors.grey)),
                SizedBox(height: 5),
                Text("Brisk Walk", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),

                // Circular Timer
                Center(
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 8.0,
                    percent: 0.2, // Change dynamically
                    center: Text("00:20", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    progressColor: Colors.black,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
                SizedBox(height: 10),
                Center(child: Text("10:59", style: TextStyle(color: Colors.black54))),
              ],
            ),
          ),

          SizedBox(height: 30,),

          // Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Stop Button
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.pause, color: Colors.black),
                  label: Text("Stop", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),

                // Next Exercise Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Mainexercise()));
                  },
                  child: Text("NEXT EXERCISE", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}