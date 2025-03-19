import 'package:flutter/material.dart';
import 'package:resqheart/pages/lifestyle/exercise/snbriskwalk.dart';

class Briskwalk extends StatefulWidget {
  const Briskwalk({super.key});

  @override
  State<Briskwalk> createState() => _BriskwalkState();
}

class _BriskwalkState extends State<Briskwalk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Image
          Stack(
            children: [
              Image.asset(
                'assets/ex1.png',
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
                          Text("30 min"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "BRISK WALK",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "A moderate-intensity walk that helps improve heart health, circulation, and endurance. Safe and effective for heart patients when done at a steady pace.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 5,),

                  Text("Tips: \n1. Walk at a comfortable but steady pace. \n2. Keep good posture and breathe deeply. \n3. Stay hydrated and avoid extreme heat. \n4. Rest if you feel dizzy or breathless."),
                  
                  SizedBox(height: 10),
                  Text(
                    "5 times/ week",
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Snbriskwalk()));
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