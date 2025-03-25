import 'package:flutter/material.dart';
import 'package:resqheart/pages/lifestyle/exercise/mainexercise.dart';
import 'package:resqheart/pages/lifestyle/food/mainfood.dart';
import 'package:resqheart/pages/lifestyle/insights/maininsight.dart';

class Lifestyle extends StatefulWidget {
  const Lifestyle({super.key});

  @override
  State<Lifestyle> createState() => _LifestyleState();
}

class _LifestyleState extends State<Lifestyle> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView( child:  Container(
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Lifestyle Management", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Mainfood()));
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage("assets/lsfood.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: Colors.black45,
                    ),
                    child: Text(
                      "Healthy Food\nDiscover nutritious meal plans and healthy recipes",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Mainexercise()));
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage("assets/lsexercise.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: Colors.black45,
                    ),
                    child: Text(
                      "Exercise\nStay fit with guided workouts and fitness routines",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Maininsight()));
              },
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage("assets/lsinsight.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: Colors.black45,
                    ),
                    child: Text(
                      "Health Insights\nGet valuable health tips and wellness insights",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
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