import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'details5.dart';

class Details4 extends StatefulWidget {
  const Details4({super.key});

  @override
  State<Details4> createState() => _Details4State();
}

class _Details4State extends State<Details4> {
  Set<String> selectedItems = {};

  final List<String> diseaseOptions = [
    "ARYTHMIA",
    "STROKE",
    "HEART ATTACK",
    "NONE"
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.02),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: screenWidth * 0.08),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts when keyboard appears
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.09),
              child: Text(
                'Step 4 of 5',
                style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.09),
              child: Text(
                'YOUR HEART DISEASES',
                style: GoogleFonts.bebasNeue(fontSize: 40),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: screenHeight * 0.0,
                  mainAxisSpacing: screenHeight * 0.02,
                  childAspectRatio: 5,
                ),
                itemCount: diseaseOptions.length,
                itemBuilder: (context, index) {
                  String disease = diseaseOptions[index];
                  bool isSelected = selectedItems.contains(disease);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedItems.remove(disease);
                        } else {
                          selectedItems.add(disease);
                        }
                      });
                    },
                    child: Center(
                      child: Container(
                        width: screenWidth * 0.9, // 60% of screen width
                        height: screenHeight * 0.08, // Adjusted height
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? const Color(0xFF364FF5) : Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            disease,
                           style: GoogleFonts.bebasNeue(
                              fontSize: 26,
                            
                              color: isSelected ? Colors.white : Colors.black,
                            ),

                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
             Column(
  children: [
   
    Center(

      child: Padding(padding: EdgeInsets.only(bottom: screenHeight*0.03),
     child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF364FF5),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.35, vertical: screenHeight * 0.025),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
       onPressed: () {
       print("Selected Diseases: $selectedItems"); // Prints selected diseases in the console
      Navigator.push(
        context,
    MaterialPageRoute(builder: (context) => const Details5()),
  );
},

        child: Text(
          'NEXT STEPS',
          style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white),
        ),
      ),
    ),
    ),
  ],
),

          ],
        ),
      ),
    );
  }
}
