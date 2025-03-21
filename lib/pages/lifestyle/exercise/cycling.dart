import 'package:flutter/material.dart';
import 'package:resqheart/pages/lifestyle/exercise/sncycling.dart';

class Cycling extends StatefulWidget {
  const Cycling({super.key});

  @override
  State<Cycling> createState() => _CyclingState();
}

class _CyclingState extends State<Cycling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Image
          Stack(
            children: [
              Image.asset(
                'assets/ex3.png',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),

          // Info Section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.black),
                          SizedBox(width: 5),
                          Text("135 kcal"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_alarm, color: Colors.black),
                          SizedBox(width: 5),
                          Text("40 min"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "CYCLING",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "A low-impact exercise that strengthens the heart, improves circulation, and reduces blood pressure. Suitable for heart patients when done at a moderate pace.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 5,),

                  Text("Tips: \n1. Start with short, gentle rides. \n2. Maintain a steady and comfortable speed. \n3. Avoid steep hills and overexertion, \n4. Stay hydrated and monitor your heart rate."),
                  
                  SizedBox(height: 10),
                  Text(
                    "4 times/ week",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Sncycling()));
                      },
                      child: Text("START NOW", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}