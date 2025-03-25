import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'details3.dart';

class Details2 extends StatefulWidget {
  const Details2({super.key});

  @override
  State<Details2> createState() => _Details2State();
}

class _Details2State extends State<Details2> {
  bool isKgSelected = true;
  double weight = 50.0;
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _weightController.text = weight.toStringAsFixed(1);
  }

  void toggleUnit(int index) {
    setState(() {
      if (index == 0 && isKgSelected) {
        weight = weight * 2.20462; // Convert kg to lbs
        isKgSelected = false;
      } else if (index == 1 && !isKgSelected) {
        weight = weight / 2.20462; // Convert lbs to kg
        isKgSelected = true;
      }
      _weightController.text = weight.toStringAsFixed(1);
    });
  }

  void updateWeight(String value) {
    setState(() {
      weight = double.tryParse(value) ?? weight;
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
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
              child: Text(
                'Step 2 of 5',
                style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'HOW MUCH DO YOU WEIGH?',
                style: GoogleFonts.bebasNeue(fontSize: 40),
              ),
              SizedBox(height: screenHeight * 0.07),
              Center(
                child: Column(
                  children: [
                    ToggleButtons(
                      borderRadius: BorderRadius.circular(10),
                      selectedBorderColor: Colors.black,
                      fillColor: Colors.white,
                      color: Colors.black,
                      selectedColor: Colors.black,
                      isSelected: [!isKgSelected, isKgSelected],
                      onPressed: toggleUnit,
                      borderWidth: 3,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.02),
                          child: Text(
                            "LBS",
                            style: GoogleFonts.bebasNeue(fontSize: screenWidth * 0.07),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.02),
                          child: Text(
                            "KG",
                            style: GoogleFonts.bebasNeue(fontSize: screenWidth * 0.07),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
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
                            width: screenWidth * 0.6,
                            child: TextField(
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              onChanged: updateWeight,
                              decoration: const InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          Text(
                            isKgSelected ? " kg" : " lbs",
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.31),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF364FF5),
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3, vertical: screenHeight * 0.025),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Details3()),
                        );
                      },
                      child: Text(
                        'NEXT STEPS',
                        style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white),
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
    _weightController.dispose();
    super.dispose();
  }
}