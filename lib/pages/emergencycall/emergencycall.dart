import 'package:flutter/material.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Emergency Contact", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            Text(
              'In case of emergency, contact:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20,),
            // 📍 Map Container (Static Image)
            SizedBox(
              height: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Stack(
                    children: [
                      Image.asset('assets/mapui.png', width: double.infinity, fit: BoxFit.cover),
                      Center(
                        child: Column(
                          children: [
                            const Center(
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                             Text("My Current\n  Location", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.local_hospital, color: Colors.red),
                title: Text('Nearest Hospital'),
                subtitle: Text('Call for immediate medical assistance'),
                trailing: IconButton(
                  icon: Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'EMERGENCY CALL',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



