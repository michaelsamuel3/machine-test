// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:machinetest/routes.dart';
import 'package:machinetest/screens/home.dart';
import 'package:machinetest/screens/splashscreen.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      routes: {
        Routes.splashScreen:(context)=>SplashScreen(),
        Routes.homescreen:(context)=>HomeScreen(),
       
      },
    );
  }
}