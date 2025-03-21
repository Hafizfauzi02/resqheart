import 'dart:ffi';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:resqheart/pages/community/community.dart';
import 'package:resqheart/pages/emergencycall/emergencycall.dart';
import 'package:resqheart/pages/heartrate/heratrate.dart';
import 'package:resqheart/pages/home.dart';
import 'package:resqheart/pages/lifestyle/lifestyle.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTabIndex=0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Community community;
  late Heratrate heratrate;
  late Call call;
  late Lifestyle lifestyle;

  @override
  void initState(){
    homepage = Home();
    community = Community();
    heratrate = Heratrate();
    call = Call();
    lifestyle = Lifestyle();
    pages =[homepage, community, heratrate, call, lifestyle];
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
          });
        },
        items: [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.public,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.call,
            color: Colors.white,
          ),
          Icon(
            Icons.self_improvement,
            color: Colors.white,
          )
        ]),
        body: pages[currentTabIndex],
    );
  }
}