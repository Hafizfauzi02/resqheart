import 'package:flutter/material.dart';
import 'package:resqheart/pages/userprofile.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration( color: Colors.white
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4)
                      )
                    ]
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Userprofile()));
                    },
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: AssetImage("assets/hafiz.jpeg"),
                    ),
                  ),
                ),
                SizedBox(width: 16,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Hello Hafiz Fauzi", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("Welcome to ResQHeart", style: TextStyle(color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w500),)
                  ],
                ),
                SizedBox(width: 80,),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 4)
                      )
                    ]
                  ),
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Column(
                      children: [
                        Icon(Icons.smart_toy_rounded, color: Colors.amber.shade500,),
                        Text("ChatBot", style: TextStyle(fontSize: 10),)
                      ],
                    ),
                  ),
                )
              ],
            ),
            
            SizedBox(height: 25,),

            Card(
                shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.blue[500],
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0 min ago',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Text(
                  'More details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Heart Rate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '81 BPM Normal',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Heart Rate Variability',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 120,
                      child: LinearProgressIndicator(
                        value: 0.6,
                        backgroundColor: Colors.black12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stress Level',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 120,
                      child: LinearProgressIndicator(
                        value: 0.4,
                        backgroundColor: Colors.black12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
            ),
          
    
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Community Activities", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text("See all", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(

              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/image1.jpg", height: 200, width: MediaQuery.of(context).size.width,fit: BoxFit.cover,)),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Sept\n1-29",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("World Heart Day", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.black,),
                      Text("Kuala Lumpur")
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Container(
              margin: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(

              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/image3.avif", height: 200, width: MediaQuery.of(context).size.width,fit: BoxFit.cover,)),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Sept\n30",textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Webinar", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.black,),
                      Text("Online Meet")
                    ],
                  ),
                )
              ],
            ),
            
          ],
        ),
      ),
      
    );
  }
}