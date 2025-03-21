import 'package:flutter/material.dart';
import 'package:resqheart/pages/authentication/login.dart';
import 'package:resqheart/pages/bottomnav.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //New userprofile
      body: Container(
        padding: EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Bottomnav()));
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
                SizedBox(width: 110,),
                Text("Edit Prtofile", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset("assets/hafiz.jpeg", width: 100,height: 100,)
              ),
            ),

            //Edit
            SizedBox(height: 10,),

            Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Full Name", "Hafiz"),
              _buildTextField("Phone", "01111432567", enabled: true),
              _buildTextField("Email address", "hafizfauzi@gmail.com", enabled: true),
              _buildWeightHeightRow(),
              _buildGenderDropdown(),
              _buildTextField("Age", "21"),
              _buildTextField("Heart Rate (BPM)", "72"),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Bottomnav()));
                  },
                  child: Text("SAVE", style: TextStyle(color: Colors.white)),
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