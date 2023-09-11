// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class Loading extends StatelessWidget {
//   const Loading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           child: Lottie.asset(
//             "assets/loading.json",
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:vaayusastra_app/courses.dart'; // Import the dashboard page

class Loading extends StatelessWidget {
  const Loading({Key? key});

  @override
  Widget build(BuildContext context) {
    // Simulate a loading delay
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardApp()), // Navigate to the dashboard
      );
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Lottie.asset(
            "loading.json",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


