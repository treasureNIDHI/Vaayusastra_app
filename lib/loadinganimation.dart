import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Lottie.asset(
            "assets/loading.json",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
