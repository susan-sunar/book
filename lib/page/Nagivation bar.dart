
import 'package:book/page/favorite.dart';
import 'package:book/page/homepage.dart';
import 'package:book/page/profile.dart';



import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class PracticeBottomNavBar extends StatefulWidget {
  const PracticeBottomNavBar({super.key});
  @override
  State<PracticeBottomNavBar> createState() => _PracticeBottomNavBarState();}
class _PracticeBottomNavBarState extends State<PracticeBottomNavBar> {
  List list = [
    HomePage(),
    Profile(username: '', email: '', contact: '',),
    Favorite(),
  ];
  List<Icon> allItems = [
    Icon(Icons.home,color: Colors.white,),
    Icon(Icons.person,color: Colors.white,),
    //Icon(Icons.medication_liquid_outlined,color: Colors.white,),
    Icon(Icons.book,color: Colors.white,)
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color:Color(0xff0077b6) ,

        buttonBackgroundColor:Color(0xff0077b6),
        index: _currentIndex,
        onTap: (int index){
          _currentIndex = index;
          setState(() {
          });
        },
        items: allItems,
      ),
    );  }
}
