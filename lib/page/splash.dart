import 'dart:async';
import 'package:book/google%20font.dart';
import 'package:book/page/registration.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 60),
            () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (builder) => Registration()),
                (route) => false)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
              style: myStyle(26,Colors.blue,FontWeight.bold),
              children: [
                TextSpan(text: "Books",
                ),
                TextSpan(text: "Store", style: myStyle(26,Colors.blue,FontWeight.bold)
                ),

              ]
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [

            Image.asset("assets/image/splas.jpg")
          ],
        ),
      ),
    );
  }
}