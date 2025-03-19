import 'package:flutter/material.dart';
import 'package:resqheart/pages/lifestyle/exercise/snzumba.dart';

class Zumba extends StatefulWidget {
  const Zumba({super.key});

  @override
  State<Zumba> createState() => _ZumbaState();
}

class _ZumbaState extends State<Zumba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Image
          Stack(
            children: [
              Image.asset(
                'assets/ex2.png',
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
                          Text("20 min"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "ZUMBA",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "A fun dance workout that enhances heart health, boosts stamina, and improves coordination. Ideal for heart patients when done at a controlled intensity.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 5,),

                  Text("Tips: \n1. Follow low-impact moves and go at your own pace. \n2. Avoid sudden, intense movements. \n3. Stay hydrated and take breaks as needed. \n4. Listen to your body and stop if you feel dizzy."),
                  
                  SizedBox(height: 10),
                  Text(
                    "3 times/ week",
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Snzumba()));
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