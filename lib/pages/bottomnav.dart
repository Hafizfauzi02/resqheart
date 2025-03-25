import 'dart:ffi';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:resqheart/pages/community/community.dart';
import 'package:resqheart/pages/emergencycall/emergencycall.dart';
import 'package:resqheart/pages/heartrate/heartrate1.dart';
import 'package:resqheart/pages/heartrate/heartrate2.dart';
import 'package:resqheart/pages/home.dart';
import 'package:resqheart/pages/lifestyle/lifestyle.dart';
class Bottomnav extends StatefulWidget {
  final int initialIndex;
  const Bottomnav({super.key, this.initialIndex = 0});  // Default to Home

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late int currentTabIndex;

  late List<Widget> pages;
  late Home homepage;
  late CommunityScreen community;
  late Heartrate heartrate;
  late Heartrate2 heartrate2;
  late Call call;
  late Lifestyle lifestyle;

  @override
  void initState() {
    super.initState();
    homepage = Home();
    community = CommunityScreen();
    heartrate = Heartrate();
    heartrate2 = Heartrate2();
    call = Call();
    lifestyle = Lifestyle();

    pages = [homepage, community, heartrate, call, lifestyle];

    // Use the passed index from the constructor
    currentTabIndex = widget.initialIndex;
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    bottomNavigationBar: CurvedNavigationBar(
      index: currentTabIndex, // ✅ Set the initial index
      height: 65,
      backgroundColor: Colors.white,
      color: Colors.black,
      animationDuration: Duration(milliseconds: 500),
      onTap: (int index) {
        setState(() {
          currentTabIndex = index;
        });
      },
      items: [
        Icon(Icons.home_outlined, color: Colors.white),
        Icon(Icons.public, color: Colors.white),
        Icon(Icons.favorite, color: Colors.white), // Heart rate tab
        Icon(Icons.call, color: Colors.white),
        Icon(Icons.self_improvement, color: Colors.white),
      ],
    ),
    body: pages[currentTabIndex],
  );
}
}