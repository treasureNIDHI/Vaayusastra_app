// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// void main() {
//    SystemChrome.setSystemUIOverlayStyle(
//     SystemUiOverlayStyle(
//       statusBarColor: const Color.fromARGB(255, 65, 8, 4),
//       systemNavigationBarColor: Color.fromARGB(255, 65, 5, 1),
//     ),
//   );
  
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Page',
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange, // Choose your desired primary color
//       ),
//       debugShowCheckedModeBanner: false, //to remove the debug banner from the screen
//       home: const LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Page'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'Login to Your Account',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Add your authentication logic here
//                   // For demonstration purposes, let's just navigate to a dummy home page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const HomePage()),
//                   );
//                 },
//                 child: const Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: Center(
//         child: const Text('Welcome to the Home Page!'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vaayusastra_app/splash_screen.dart'; // Import your splash screen widget

void main() {
  // runApp(MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(), // Render your splash screen widget directly
    );
  }
}