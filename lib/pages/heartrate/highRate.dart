import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:resqheart/pages/heartrate/heartrate1.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:resqheart/pages/heartrate/heartrate2.dart';
import 'package:resqheart/pages/heartrate/highHeartHome.dart';
import 'package:resqheart/pages/bottomnav.dart';

class Highrate extends StatefulWidget {
  const Highrate({super.key});

  @override
  State<Highrate> createState() => _HighRate();
}

class _HighRate extends State<Highrate> {
  int currentYear = DateTime.now().year;

  final List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  void changeYear(int offset) {
    setState(() {
      currentYear += offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
         onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Bottomnav()), // Navigate to Heartrate1
    );
  },
),
        title: Text(
          "CALENDAR - $currentYear", 
          style: GoogleFonts.kronaOne(fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        
        child:  Column(
          children: [
            // Year Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => changeYear(-1),
                ),
                Text(
                  "$currentYear",
                  style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () => changeYear(1),
                ),
              ],
            ),

            // Scrollable Calendar
            Expanded(
              child: ListView.builder(
                itemCount: months.length,
                itemBuilder: (context, index) {
                  return MonthCalendarWidget(
                    month: months[index],
                    year: currentYear,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to Display Each Month
class MonthCalendarWidget extends StatelessWidget {
  final String month;
  final int year;

  const MonthCalendarWidget({required this.month, required this.year, super.key});

  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth = DateTime(year, _getMonthNumber(month), 1);
    DateTime lastDayOfMonth = DateTime(year, _getMonthNumber(month) + 1, 0);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month Header
          Row(
            children: [
              Text(
                "${_getMonthNumber(month).toString().padLeft(2, '0')}",
                style: GoogleFonts.kronaOne(fontSize: 32, color: Colors.black),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "$year",
                  style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(width: 8),
              Text(
                month.toUpperCase(),
                style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 8),

          // Calendar Grid
          Table(
            border: TableBorder.all(color: Colors.black26, width: 0.5),
            children: [
              _buildWeekHeader(),
              ..._buildCalendarRows(firstDayOfMonth, lastDayOfMonth, context),
            ],
          ),
        ],
      ),
    );
  }

  // Convert Month Name to Month Number
  int _getMonthNumber(String month) {
    return DateFormat.MMMM().parse(month).month;
  }

  // Weekday Row
  TableRow _buildWeekHeader() {
    return TableRow(
      children: ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
          .map((day) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text(
                    day,
                    style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ))
          .toList(),
    );
  }

  // Generate Calendar Days
  List<TableRow> _buildCalendarRows(DateTime firstDay, DateTime lastDay, BuildContext context) {
    List<TableRow> rows = [];
    List<Widget> currentWeek = [];

    // Fill Empty Days Before First Day of Month
    for (int i = 1; i < firstDay.weekday; i++) {
      currentWeek.add(Container());
    }

    // Fill Actual Days
    for (int day = 1; day <= lastDay.day; day++) {
      DateTime currentDay = DateTime(firstDay.year, firstDay.month, day);
      bool isSunday = currentDay.weekday == DateTime.sunday;
      bool isSaturday = currentDay.weekday == DateTime.saturday;

      currentWeek.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DateDetailsPage3(date: currentDay),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Text(
                day.toString(),
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSunday ? Colors.red : (isSaturday ? Colors.blue : Colors.black),
                ),
              ),
            ),
          ),
        ),
      );

      // When the week is complete, add the row
      if (currentWeek.length == 7) {
        rows.add(TableRow(children: List.from(currentWeek)));
        currentWeek.clear();
      }
    }

    // Fill Empty Days After Last Day of Month
    while (currentWeek.length < 7) {
      currentWeek.add(Container());
    }
    rows.add(TableRow(children: currentWeek));

    return rows;
  }
}

// New Page: Displays Selected Date
class DateDetailsPage3 extends StatelessWidget {
  final DateTime date;

  const DateDetailsPage3({required this.date, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
           onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Highhearthome()), // Navigate to Heartrate1
    );
  },
        ),
        title: Text(
          "DATE DETAILS",
          style: GoogleFonts.kronaOne(fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Makes the page scrollable
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_left, size: 32),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DateDetailsPage3(date: date.subtract(Duration(days: 1))),
                        ),
                      );
                    },
                  ),
                  Text(
                    DateFormat('EEEE, MMMM d, yyyy').format(date),
                    style: GoogleFonts.montserrat(fontSize: screenWidth * 0.045, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right, size: 32),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DateDetailsPage3(date: date.add(Duration(days: 1))),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),

              // Score Box + Analysis
              Container(
                width: screenWidth * 0.8,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(233, 241, 70, 70),
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Score',
                      style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      '110 BPM',
                      style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Row with three rectangles + labels
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildIndicator("LOW",Colors.white, ),
                        SizedBox(width: 20),
                        _buildIndicator("NORMAL", Colors.white),
                        SizedBox(width: 20),
                        _buildIndicator("HIGH",const Color.fromARGB(255, 255, 0, 0)),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // "Last Scanned" Section
                    _buildLastScannedSection(screenWidth, screenHeight,date),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              // Healthy Heart Info
              _buildHealthyHeartInfo(screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build heart rate indicator
 Widget _buildIndicator(String label, Color color) {
  return Column(
    children: [
      Container(
        width: 80,
        height: 10,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2), // Added border
        ),
      ),
      SizedBox(height: 5),
      Text(
        label,
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ],
  );
}


  // Function to build "Last Scanned" section
Widget _buildLastScannedSection(double screenWidth, double screenHeight, DateTime date) {
  String formattedDate = DateFormat('dd/MM/yyyy').format(date);

  return Container(
    width: screenWidth * 0.7,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Text(
          "Last Scanned",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 6), // Changed to red
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  formattedDate, // Display dynamic date
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Result Analysis",
                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  "Heart Rate: High",
                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                SizedBox(height: 5),
                Text(
                  "ECG Analysis:",
                  style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Tachycardia Detected",
                  style: GoogleFonts.montserrat(fontSize: 14, decoration: TextDecoration.underline, color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

// Function to build high BPM info section
Widget _buildHealthyHeartInfo(double screenWidth) {
  return Container(
    width: screenWidth * 0.9,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.red.shade700, // High BPM warning in red
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 8,
          spreadRadius: 2,
          offset: Offset(0, 4),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          LucideIcons.heartPulse,
          color: Colors.white,
          size: screenWidth * 0.12,
        ),
        SizedBox(height: 10),
        Text(
          "HIGH HEART RATE DETECTED",
          style: GoogleFonts.montserrat(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: screenWidth * 0.85,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Your Result Analysis",
                  style: GoogleFonts.kronaOne(
                    fontSize: screenWidth * 0.045,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 10),
              _buildResultItem("⚠ HIGH Heart Rate", LucideIcons.alertTriangle),
              _buildSubItem("• Above 100 BPM (Tachycardia)"),
              _buildSubItem("• Can cause shortness of breath, dizziness, or chest pain"),
              Divider(thickness: 1),
              _buildResultItem("📌 Possible Causes", LucideIcons.info),
              _buildSubItem("  - Anxiety & stress 😰"),
              _buildSubItem("  - Dehydration 💧"),
              _buildSubItem("  - Excess caffeine ☕"),
              Divider(thickness: 1),
              _buildResultItem("⚠ Risks & Symptoms", LucideIcons.thermometer),
              _buildSubItem("  - Rapid heartbeat 💓"),
              _buildSubItem("  - Dizziness & fainting"),
              _buildSubItem("  - Chest pain or palpitations ❤️"),
              Divider(thickness: 1),
              _buildResultItem("📊 Monitoring & Actions", LucideIcons.stethoscope),
              _buildSubItem("  - Avoid caffeine & alcohol 🍷"),
              _buildSubItem("  - Practice deep breathing exercises 🧘‍♂️"),
              _buildSubItem("  - Seek medical help if symptoms persist 👩‍⚕️"),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildResultItem(String text, IconData icon) {
  return Row(
    children: [
      Icon(icon, color: Colors.red.shade700, size: 20), // Changed to red for warning
      SizedBox(width: 5),
      Expanded(
        child: Text(
          text,
          style: GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

Widget _buildSubItem(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Text(
      text,
      style: GoogleFonts.dmSans(fontSize: 14, color: Colors.black87),
    ),
  );
}
}