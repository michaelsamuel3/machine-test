// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:machinetest/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    Future.delayed(Duration(seconds: 5), () async {
      Navigator.pushNamed(context, Routes.homescreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(255, 237, 228, 228),
      body:
       SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/flying.png"))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " comic masters".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )
            ],
          )),
    );
  }
}
