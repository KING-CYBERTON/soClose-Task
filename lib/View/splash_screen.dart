import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxy_boot/Styles/color.dart';
import 'package:oxy_boot/Widgets/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(microseconds: 200), () {
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(image: 
          //   AssetImage(''))
          // ),
          height:200 ,
          child: Column(
            children: [
             
              Center(
                child: Image.asset(
                  "assets/images/goodtimes.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
               width: double.infinity,
                  height: 100,
                child: Center(
                  child: Text(
                    "Good Times \n      Trends",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "airbnb",
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
