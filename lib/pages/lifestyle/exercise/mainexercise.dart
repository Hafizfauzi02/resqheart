import 'package:flutter/material.dart';
import 'package:resqheart/pages/lifestyle/exercise/briskwalk.dart';
import 'package:resqheart/pages/lifestyle/exercise/cycling.dart';
import 'package:resqheart/pages/lifestyle/exercise/zumba.dart';
import 'package:resqheart/pages/lifestyle/lifestyle.dart';

class Mainexercise extends StatefulWidget {
  const Mainexercise({super.key});

  @override
  State<Mainexercise> createState() => _MainexerciseState();
}

class _MainexerciseState extends State<Mainexercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Lifestyle()));
                  },
                  child: Icon(Icons.arrow_back_ios)),
                SizedBox(width: 70,),
                Center(child: Text("Exercise Suggestions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ],
            ),
            SizedBox(height: 20,),

            //Exercise Cards
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Briskwalk()));
              },
              child: Card(
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    "assets/ex1.png",
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border, color: Colors.red),
                  ),
                ),
              ],
                        ),
                        Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Brisk Walking",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "5 Times/Week",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Spacer(),
                      Icon(Icons.access_time, size: 16, color: Colors.teal),
                      SizedBox(width: 5),
                      Text(
                        "30min",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
                        ),
                      ],
                    ),
                  ),
            ),
    SizedBox(height: 10,),

            //Exercise Cards
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Zumba()));
              },
              child: Card(
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    "assets/ex2.png",
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border, color: Colors.red),
                  ),
                ),
              ],
                        ),
                        Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Zumba",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "3 Times/Week",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Spacer(),
                      Icon(Icons.access_time, size: 16, color: Colors.teal),
                      SizedBox(width: 5),
                      Text(
                        "20min",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
                        ),
                      ],
                    ),
                  ),
            ),
    SizedBox(height: 10,),

            //Exercise Cards
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Cycling()));
              },
              child: Card(
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    "assets/ex3.png",
                    width: double.infinity,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border, color: Colors.red),
                  ),
                ),
              ],
                        ),
                        Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cycling",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "4 Times/Week",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Spacer(),
                      Icon(Icons.access_time, size: 16, color: Colors.teal),
                      SizedBox(width: 5),
                      Text(
                        "40min",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
                        ),
                      ],
                    ),
                  ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
