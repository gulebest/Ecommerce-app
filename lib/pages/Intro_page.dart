import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset('assets/images/logo.png', height: 240),
          ),

          //title
          Text(
            'Just Do It',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          //subtitle
          Text(
            'Brand New sneakers Just For You',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          //start now button
        ],
      ),
    );
  }
}
