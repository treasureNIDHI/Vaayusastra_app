import "package:flutter/material.dart";
import 'package:vaayusastra_app/EigtoTenLessonContents.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'EigtoTenLessonContents.dart';

class Levelpage_2 extends StatefulWidget {
  Levelpage_2({super.key});

  @override
  State<Levelpage_2> createState() => _LevelpageState();
}

class _LevelpageState extends State<Levelpage_2> {
  int selectedLevel = 1;

  List<Widget> lessonData = [];
  List<dynamic> Lesson_Data = [];
  void Levelselect(int i) {
    setState(() {
      selectedLevel = i;
    });
  }

  void getPostData() {
    switch (selectedLevel) {
      case 1:
        Lesson_Data = Lesson_Data1;
        break;

      case 2:
        Lesson_Data = Lesson_data2;
        break;
      case 3:
        Lesson_Data = Lesson_data3;
        break;
      case 4:
        Lesson_Data = Lesson_data4;
        break;
      case 5:
        Lesson_Data = Lesson_data5;
        break;
      case 6:
        Lesson_Data = Lesson_data6;
        break;
      case 7:
        Lesson_Data = Lesson_data7;
        break;
      case 8:
        Lesson_Data = Lesson_data8;
        break;
      case 9:
        Lesson_Data = Lesson_data9;
        break;
    }
    List<dynamic> responseList = Lesson_Data;
    List<Widget> listItems = [];
    responseList.forEach((element) {
      listItems.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: InkWell(
          onTap: () {
            launch(element["URI"]);
          },
          child: Container(
            child: Center(
              child: Text(
                element["Name"],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            height: 80,
            decoration: BoxDecoration(
                color: Color(0xffFDE8DE),
                border: Border.all(color: Color(0xff880D1E), width: 3),
                borderRadius: BorderRadius.all(Radius.circular(31))),
          ),
        ),
      ));
    });
    setState(() {
      lessonData = listItems;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffFFCBB1),
          body: Container(
            height: size.height,
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 74,
                      width: 300,
                      child: Center(
                        child: Text(
                          "Explore The Lessons",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffFDE8DE),
                          border: Border.all(color: Color(0xff880D1E)),
                          borderRadius: BorderRadius.all(Radius.circular(23))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 115,
                        child: Center(
                          child: Text(
                            "Levels",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffFDE8DE),
                            border: Border.all(color: Color(0xff880D1E)),
                            borderRadius: BorderRadius.all(Radius.circular(23))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                LevelScroller(
                  onLevelSelected: (level) {
                    Levelselect(level);
                    getPostData();
                  },
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 10, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 115,
                        child: Center(
                          child: Text(
                            "Lesson",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffFDE8DE),
                            border: Border.all(color: Color(0xff880D1E)),
                            borderRadius: BorderRadius.all(Radius.circular(23))),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: lessonData.length,
                        itemBuilder: (context, index) {
                          return lessonData[index];
                        }))
              ],
            ),
          ),
        ));
  }
}

class LevelScroller extends StatelessWidget {
  final Function(int) onLevelSelected;
  const LevelScroller({Key? key, required this.onLevelSelected})
      : super(key: key);
  void levels(int x) {}

  @override
  Widget build(BuildContext context) {
    _LevelpageState levelpage = new _LevelpageState();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    onLevelSelected(1);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Level 1",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xffEBA4A4), Colors.white]),
                        border: Border.all(color: Colors.grey, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(31))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    onLevelSelected(2);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Level 2",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color(0xffEBA4A4),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(31))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    onLevelSelected(3);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Level 3",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color(0xffEBA4A4),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(31))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    onLevelSelected(4);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Level 4",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color(0xffEBA4A4),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(31))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    onLevelSelected(5);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Level 5",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color(0xffEBA4A4),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(31))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    onLevelSelected(6);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Level 6",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color(0xffEBA4A4),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(31))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    onLevelSelected(7);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Level 7",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color(0xffEBA4A4),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(31))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    onLevelSelected(8);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Level 8",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color(0xffEBA4A4),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(31))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    onLevelSelected(9);
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Level 9",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Color(0xffEBA4A4),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(31))),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
