// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> superhero;

  const DetailScreen({required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 189, 210, 221),
        title: Text("description screen".toUpperCase()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ SizedBox(height: 10),
            Container(height: 50,width: double.infinity,
            color: Color.fromARGB(255, 194, 211, 242),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(' ${superhero['name']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
            ),
            SizedBox(height: 10),
            Container(height: 150,
            color:const Color.fromARGB(255, 237, 228, 228),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(' ${superhero['power']}', style: TextStyle(fontSize: 15)),
              ),
            ),
            // SizedBox(height: 8),
            // Container(
            //    height: 130,
            //     color: const Color.fromARGB(255, 237, 228, 228),
            //   child: Padding(
            //     padding: const EdgeInsets.all(5.0),
            //     child: Text(' ${superhero['description']}', style: TextStyle(fontSize: 16)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
