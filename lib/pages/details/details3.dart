import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'details4.dart';

class Details3 extends StatefulWidget {
  const Details3({super.key});

  @override
  State<Details3> createState() => _Details3State();
}

class _Details3State extends State<Details3> {
  bool isCmSelected = true;
  double height = 150.0;
  final TextEditingController _heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _heightController.text = height.toStringAsFixed(1);
  }

  void toggleUnit(int index) {
    setState(() {
      if (index == 0 && isCmSelected) {
        height = height / 30.48; // Convert cm to feet
        isCmSelected = false;
      } else if (index == 1 && !isCmSelected) {
        height = height * 30.48; // Convert feet to cm
        isCmSelected = true;
      }
      _heightController.text = height.toStringAsFixed(1);
    });
  }

  void updateHeight(String value) {
    setState(() {
      height = double.tryParse(value) ?? height;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
       
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts when keyboard appears
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.09),
                child: Text(
                  'Step 3 of 5',
                  style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.09),
                child: Text(
                  'HOW MUCH DO YOU HEIGHT?',
                  style: GoogleFonts.bebasNeue(fontSize: 40),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: screenHeight * 0.07)),
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(10),
                      selectedBorderColor: Colors.black,
                      fillColor: Colors.white,
                      color: Colors.black,
                      selectedColor: Colors.black,
                      isSelected: [!isCmSelected, isCmSelected],
                      onPressed: toggleUnit,
                      borderWidth: 3,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.08, vertical: screenHeight * 0.02),
                          child: Text(
                            "FEET",
                            style: GoogleFonts.bebasNeue(fontSize: screenWidth * 0.07),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.08, vertical: screenHeight * 0.02),
                          child: Text(
                            "CM",
                            style: GoogleFonts.bebasNeue(fontSize: screenWidth * 0.07),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(padding: EdgeInsets.only(top: screenHeight * 0.02)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.7,
                            child: TextField(
                              controller: _heightController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              onChanged: updateHeight,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Text(
                            isCmSelected ? " cm" : " ft",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: screenHeight * 0.3)), // Adjusted space
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF364FF5), // Correct blue color
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.3, vertical: screenHeight * 0.025),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        ),
                      ),
                      onPressed: () {
                        // Navigate to Details2 page when button is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Details4()),
                        );
                      },
                      child: Text(
                        'NEXT STEPS',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 25, // Adjust size if needed
                          color: Colors.white,
                        ),
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

  @override
  void dispose() {
    _heightController.dispose();
    super.dispose();
  }
}
