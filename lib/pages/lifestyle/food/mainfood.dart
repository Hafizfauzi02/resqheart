import 'package:flutter/material.dart';
import 'package:resqheart/pages/lifestyle/food/meal1.dart';
import 'package:resqheart/pages/lifestyle/food/meal2.dart';
import 'package:resqheart/pages/lifestyle/food/meal3.dart';
import 'package:resqheart/pages/lifestyle/lifestyle.dart';

class Mainfood extends StatefulWidget {
  const Mainfood({super.key});

  @override
  State<Mainfood> createState() => _MainfoodState();
}

class _MainfoodState extends State<Mainfood> {
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
                SizedBox(width: 80,),
                Center(child: Text("Meal Suggestions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ],
            ),
            SizedBox(height: 20,),

            //Exercise Cards
            GestureDetector(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> Meal1()));
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
                    "assets/meal1.jpg",
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
                    "Oatmeal with Berries & Nuts",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Breakfast",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Spacer(),
                      Icon(Icons.local_fire_department, size: 16, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        "250-300 kcal",
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Meal2()));
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
                    "assets/meal5.avif",
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
                    "Grilled Salmon with Quinoa & Steamed Veggies",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Lunch",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Spacer(),
                      Icon(Icons.local_fire_department, size: 16, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        "400-450 kcal",
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Meal3()));
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
                    "assets/meal3.jpeg",
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
                    "Brown Rice with Stir-Fried Tofu & Vegetables ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Dinner",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Spacer(),
                      Icon(Icons.local_fire_department, size: 16, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        "280-320 kcal",
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
      )
    );
  }
}