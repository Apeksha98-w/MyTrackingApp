import 'dart:async';

import 'package:bus_driver/MainScreen/main_screen.dart';
import 'package:bus_driver/authentication/login_screen.dart';
import 'package:bus_driver/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 5), () async {
      //send user to home screen
      Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
    });
  }

  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/Screenshot (857).png"),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Get Your Journey Now",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
