import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resqheart/pages/heartrate/heartRate2.dart';
import 'package:resqheart/pages/heartrate/heartrate1.dart';
import 'package:resqheart/pages/heartrate/highHeartHome.dart';
import 'package:resqheart/pages/heartrate/highRate.dart';
import 'package:resqheart/pages/heartrate/lowHeartHome.dart';
import 'package:resqheart/pages/heartrate/lowRate.dart';

class Heartrate3 extends StatefulWidget {
  const Heartrate3({super.key});

  @override
  State<Heartrate3> createState() => _HeartRate3State();
}

class _HeartRate3State extends State<Heartrate3> {
  int selectedIndex = 0; // 0 = Finger, 1 = Face, 2 = Device
  final List<String> toggleLabels = ["Finger-Based", "Face-Based", "Device-Based"];
  
  int? selectedDeviceIndex;
  bool isConnecting = false;
  int progress = 0;
  bool showDoneButton = false;
  bool showInstruction= true;
  final List<String> devices = [
    'HUAWEI WATCH FIT 3-411',
    'SAMSUNG GALAXY WATCH 5',
    'APPLE WATCH SERIES 9',
    'FITBIT CHARGE 6',
  ];

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

 void _startProgress() {
  if (selectedIndex == 2) return; // Prevent progress for Device-Based

  setState(() {
    progress = 0;
    showDoneButton = false;
  });

  Future.doWhile(() async {
    if (!mounted || progress >= 100) return false;
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
       progress = (progress + 20).clamp(0, 100); 
      if (progress >= 100) {
        showDoneButton = true;
      }
    });
    return progress < 100;
  });
}



  void _selectDevice(int index) {
    setState(() {
      selectedDeviceIndex = index;
      isConnecting = true;
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        bool connectionSuccess = (index % 2 == 0); // Simulate success/failure (even index = success)

        setState(() {
          isConnecting = false;
          if (connectionSuccess) {
            selectedDeviceIndex = index;
          } else {
            selectedDeviceIndex = null;
          }
        });
      }
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
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts when keyboard appears
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.09),
              child: Text(
                'HEART RATE ANALYSIS',
                style: GoogleFonts.bebasNeue(fontSize: 40),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Toggle Buttons
            Center(
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                borderColor: Colors.black,
                selectedBorderColor: Colors.black,
                fillColor: const Color(0xFFF14646),
                color: Colors.black,
                selectedColor: Colors.white,
                isSelected: List.generate(3, (index) => index == selectedIndex),
              onPressed: (index) {
                setState(() {
                  selectedIndex = index;
                  progress = 0;
                  showDoneButton = false;
                  showInstruction = (index == 0 || index == 1); // Show instruction for Finger-Based and Face-Based
                  _startProgress();
                });
              },



                children: List.generate(3, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015, vertical: screenHeight * 0.02),
                    child: Text(
                      toggleLabels[index],
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: screenHeight * 0.04),

            Expanded(
              child: Center(
                child: _getSelectedWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSelectedWidget() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    String getProgressLabel(int progress) {
  if (progress <= 40) {
    return "Processing...";
  } else if (progress <= 90) {
    return "Half way there";
  } else {
    return "Completed!";
  }
}


    switch (selectedIndex) {
    case 0: 
  return showInstruction
      ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fingerprint, size: screenWidth * 0.4, color: Colors.red),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Please put your finger on the flash and don't lift it until the process is done",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.05),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                setState(() {
                  showInstruction = false;  // Hide instruction after pressing "NEXT"
                  _startProgress();
                });
              },
              child: Text("NEXT", style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white)),
            ),
          ],
        )
      : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.4,
                  child: CircularProgressIndicator(
                    value: progress / 100,
                    strokeWidth: 15,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$progress%",
                      style: GoogleFonts.montserrat(fontSize: screenWidth * 0.2, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(height: 5),
                    Text(
                      getProgressLabel(progress),
                      style: GoogleFonts.dmSans(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            if (showDoneButton)
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: ElevatedButton(
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
                      MaterialPageRoute(builder: (context) => const Heartrate()),
                    );
                  },
                  child: Text(
                    'DONE',
                    style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
          ],
        );
// Finger-Based
   case 1: // Face-Based
  return showInstruction
      ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.face, size: screenWidth * 0.4, color: Colors.blue),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Please place your face in front of your camera and wait until it's done\n\n By using this feature, you are granting the permission to use the camera ",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.05),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                setState(() {
                  showInstruction = false;  // Hide instruction after pressing "NEXT"
                  _startProgress();
                });
              },
              child: Text("NEXT", style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white)),
            ),
          ],
        )
      : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.4,
                  child: CircularProgressIndicator(
                    value: progress / 100,
                    strokeWidth: 15,
                    backgroundColor: Colors.grey[300], // Fixed background visibility
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: screenWidth * 0.8, // Adjust size if needed
                    height: screenHeight * 0.4, 
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/face_scan.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   
                    SizedBox(height: 5),
                    Text(
                      progress < 100 ? "Processing..." : "Completed!",
                      style: GoogleFonts.dmSans(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            if (showDoneButton)
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF364FF5),
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3, vertical: screenHeight * 0.025),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                   DateTime selectedDate = DateTime(2025, 3, 16); // Keep this if needed
                    _showEmergencyDialog2(context);
                  },
                  child: Text(
                    'CONTINUE',
                    style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
          ],
        );





      case 2: // Device-Based
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (selectedDeviceIndex == null) ...[
              Text("Select a Device to Connect:", style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Column(
                children: List.generate(devices.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ElevatedButton(
                      onPressed: () => _selectDevice(index),
                      child: Text(devices[index]),
                    ),
                  );
                }),
              ),
            ] else if (isConnecting) ...[
              Padding(padding: EdgeInsets.only(top:screenHeight *0.1)),
              Icon(Icons.bluetooth, size: 100, color: Colors.green),
              SizedBox(height: 20),
              Text(
                "Connecting to\n${devices[selectedDeviceIndex!]}...",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ] else ...[
               Padding(padding: EdgeInsets.only(top:screenHeight *0.1)),
              Icon(Icons.check_circle, size: 100, color: Colors.green),
              SizedBox(height: 20),
              Text(
                "Connected Successfully to\n${devices[selectedDeviceIndex!]}!",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(bottom: screenHeight*0.18)),
             ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF364FF5),
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3, vertical: screenHeight * 0.025),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                   onPressed: () {
                    DateTime selectedDate = DateTime(2025, 3, 16); // Keep this if needed
                    _showEmergencyDialog(context);
                  },
                  child: Text(
                    'DONE',
                    style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white),
                  ),
                ),
            ],
          ],
        );

      default:
        return Container();
    }
  }
}

void _showEmergencyDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents closing by tapping outside
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("Emergency Alert"),
        content: Text("The application wants to call the ambulance due to the user's resting heart rate is consistently high"),
        actions: [
          // IGNORE Button: Dismiss dialog and navigate without calling
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext, rootNavigator: true).pop(); // Close the dialog
              
              // Navigate to HighHeartHome
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Highhearthome()),
              );
            },
            child: Text("IGNORE", style: TextStyle(color: Colors.red)),
          ),
          
          // CALL Button: Proceed with ambulance call
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext, rootNavigator: true).pop(); // Close the dialog

              // Delay navigation slightly for a smooth transition
              Future.delayed(Duration(milliseconds: 300), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Highhearthome()),
                );
              });
            },
            child: Text("CALL", style: TextStyle(color: Colors.blue)),
          ),
        ],
      );
    },
  );
}


void _showEmergencyDialog2(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents closing by tapping outside
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("Emergency Alert"),
        content: Text("The application wants to call the ambulance due to the user's resting heart rate is consistently low"),
        actions: [
          // IGNORE Button: Dismiss dialog and navigate without calling
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext, rootNavigator: true).pop(); // Close the dialog
              
              // Navigate to HighHeartHome
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Lowhearthome()),
              );
            },
            child: Text("IGNORE", style: TextStyle(color: Colors.red)),
          ),
          
          // CALL Button: Proceed with ambulance call
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext, rootNavigator: true).pop(); // Close the dialog

              // Delay navigation slightly for a smooth transition
              Future.delayed(Duration(milliseconds: 300), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Highhearthome()),
                );
              });
            },
            child: Text("CALL", style: TextStyle(color: Colors.blue)),
          ),
        ],
      );
    },
  );
}

