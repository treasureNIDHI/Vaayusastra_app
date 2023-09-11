// import 'package:flutter/material.dart';

// class Login extends StatelessWidget {
//   Login({super.key});
//   final unamecon = TextEditingController();
//   final pwdcon = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             color: Color.fromARGB(100, 255, 203, 177),
//             image: DecorationImage(
//                 image: AssetImage("assets/lobg.png"), fit: BoxFit.fill)),
//         child: SingleChildScrollView(
//           child: SafeArea(
//             child: Column(
//               children: [
//                 Text(
//                   "Welcome",
//                   style: TextStyle(
//                       fontSize: 32,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 50),
//                 Image(image: AssetImage("assets/logo.png")),
//                 SizedBox(height: 30),
//                 Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 50),
//                     child: TextField(
//                       controller: unamecon,
//                       obscureText: false,
//                       decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.account_circle),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50))),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50))),
//                           labelText: "Vaayusastra ID",
//                           hintStyle: TextStyle(color: Colors.grey.shade400),
//                           fillColor: Colors.white,
//                           filled: true),
//                     )),
//                 SizedBox(height: 30),
//                 Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 50),
//                     child: TextField(
//                       controller: pwdcon,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           labelText: "Password",
//                           prefixIcon: Icon(Icons.lock),
//                           enabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50))),
//                           focusedBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(50))),
//                           hintStyle: TextStyle(color: Colors.grey.shade400),
//                           fillColor: Colors.white,
//                           filled: true),
//                     )),
//                 SizedBox(height: 15),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 25),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               disabledBackgroundColor:
//                                   Color.fromARGB(200, 136, 13, 30),
//                               backgroundColor: Color.fromARGB(100, 255, 0, 33)),
//                           onPressed: login(),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Text(
//                               "LOGIN",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ))

//                       )

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// login() {}
import 'package:flutter/material.dart';
import 'package:vaayusastra_app/loadinganimation.dart';
// import 'package:vaayusastra_app/courses.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final unamecon = TextEditingController();
  final pwdcon = TextEditingController();

  Future<void> login(BuildContext context) async {
    final String apiUrl = 'http://localhost:9000/login';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'vaayu_id': unamecon.text,
        'password': pwdcon.text,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      if (responseData['message'] == "Login successful") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Loading()),
        );
      } else {
        // Show an error message, credentials are incorrect
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid credentials')),
        );
      }
    } else {
      // Show an error message, request failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to connect to the server')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(100, 255, 203, 177),
          image: DecorationImage(
            image: AssetImage("assets/lobg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                Image(image: AssetImage("assets/logo.png")),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: unamecon,
                    obscureText: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      labelText: "Vaayusastra ID",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    controller: pwdcon,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Color.fromARGB(200, 136, 13, 30),
                      backgroundColor: Color.fromARGB(100, 255, 0, 33),
                    ),
                    onPressed: () => login(context),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

login() {}
