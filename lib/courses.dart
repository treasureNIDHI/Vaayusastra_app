import 'package:flutter/material.dart';
import 'fivet0SevenLEsson.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Color(0xffFFCBB1),
        appBar: AppBar(
          backgroundColor: Color(0xff880D1E),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 100,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: Text(
                    "Courses \n Offered",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37),
                    color: Color(0xffFDE8DE)),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => fivetoSevenLevel()));
                      },
                      child: Container(
                        height: 120,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Color(0xff960606),
                          borderRadius: BorderRadius.circular(27),
                          border:
                              Border.all(color: Color(0xffffffff), width: 5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              "5-7 AGE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -35,
                      left: 25, // Adjust the left position as needed
                      child: Container(
                        height: 90,
                        width: 90,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/img_2.jpg",
                          ),
                          radius: 50, // Adjust the radius as needed
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  fit: StackFit.loose,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 120,
                      width: 145,
                      decoration: BoxDecoration(
                        color: Color(0xff960606),
                        borderRadius: BorderRadius.circular(27),
                        border: Border.all(color: Color(0xffffffff), width: 5),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Text(
                            "8-10 AGE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -50,
                      left: 25, // Adjust the left position as needed
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/img_2.jpg"),
                        radius: 50, // Adjust the radius as needed
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 120,
                    width: 145,
                    decoration: BoxDecoration(
                      color: Color(0xff960606),
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(color: Color(0xffffffff), width: 5),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          "8-10 AGE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    left: 25, // Adjust the left position as needed
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/img_2.jpg"),
                      radius: 50, // Adjust the radius as needed
                    ),
                  ),
                ],
              ),
              Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 120,
                    width: 145,
                    decoration: BoxDecoration(
                      color: Color(0xff960606),
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(color: Color(0xffffffff), width: 5),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          "11-14 AGE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    left: 25, // Adjust the left position as needed
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/img_2.jpg"),
                      radius: 50, // Adjust the radius as needed
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 60),
            Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 120,
                  width: 145,
                  decoration: BoxDecoration(
                    color: Color(0xff960606),
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(color: Color(0xffffffff), width: 5),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "18+ AGE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -50,
                  left: 25, // Adjust the left position as needed
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/img_2.png"),
                    radius: 50, // Adjust the radius as needed
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
