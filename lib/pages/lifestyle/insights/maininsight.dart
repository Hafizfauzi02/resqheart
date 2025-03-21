import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Maininsight extends StatefulWidget {
  const Maininsight({super.key});

  @override
  State<Maininsight> createState() => _MaininsightState();
}

class _MaininsightState extends State<Maininsight> {
  final List<Map<String, String>> motivationalQuotes = [
    {
    "title": "Eat Heart-Healthy Foods",
    "message": "Focus on fruits, vegetables, whole grains, and lean proteins. Cut down on salt and processed foods. 🍎🥦"
  },
  {
    "title": "Stay Active Daily",
    "message": "Aim for at least 30 minutes of moderate exercise most days. Walking, swimming, or cycling can improve heart health! 🚶‍♀️🚴"
  },
  {
    "title": "Monitor Your Blood Pressure",
    "message": "Keep track of your blood pressure and maintain a healthy range. Hypertension is a silent risk for heart diseases. 🩺"
  },
  {
    "title": "Manage Stress Wisely",
    "message": "Practice relaxation techniques like deep breathing, meditation, or yoga to keep stress levels in check. 🧘‍♂️💆‍♀️"
  },
  {
    "title": "Get Quality Sleep",
    "message": "Poor sleep affects heart health. Aim for 7-9 hours of restful sleep each night. 😴🛌"
  },
  {
    "title": "Limit Alcohol & Quit Smoking",
    "message": "Excessive alcohol and smoking increase heart disease risk. Quit smoking and drink in moderation. 🚭🥂"
  },
  {
    "title": "Take Medications as Prescribed",
    "message": "If you're on medication, take them regularly as instructed by your doctor to prevent complications. 💊🩹"
  },
  {
    "title": "Stay Hydrated",
    "message": "Drinking enough water supports heart function and overall health. Keep a water bottle with you! 💧"
  },
  {
    "title": "Know the Warning Signs",
    "message": "Recognize symptoms like chest pain, shortness of breath, or dizziness. Seek medical help if needed. 🚑⚠️"
  },
  {
    "title": "Regular Check-Ups Matter",
    "message": "Schedule routine health check-ups to monitor your heart health and make early interventions. 📅🏥"
  }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.black,
                    
                    ),
                  ),
                  SizedBox(width: 50,),
                  Text(
                    "Motivational Insights",
                    style: _titleStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Flip the cards for motivation!",
                style: _subtitleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: motivationalQuotes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: FlipCard(
                        front: _buildFrontCard(motivationalQuotes[index]["title"]!),
                        back: _buildBackCard(motivationalQuotes[index]["message"]!),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFrontCard(String title) {
    return _buildCard(
      title,
      const Color.fromARGB(255, 91, 184, 96),
      Colors.black,
      FontWeight.bold,
    );
  }

  Widget _buildBackCard(String message) {
    return _buildCard(
      message,
      Colors.white,
      Colors.black,
      FontWeight.normal,
    );
  }
    Widget _buildCard(String text, Color bgColor, Color textColor, FontWeight fontWeight) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: bgColor,
      child: SizedBox(
        height: 150,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: textColor, fontWeight: fontWeight),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
const TextStyle _titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
const TextStyle _subtitleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey);
