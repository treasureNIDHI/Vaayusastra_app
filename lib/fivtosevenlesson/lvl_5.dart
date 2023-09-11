import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaayusastra_app/fivtosevenlesson/lessoncontents.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class lvl_5 extends StatefulWidget {
  const lvl_5({Key? key});

  @override
  State<lvl_5> createState() => _lvl_5State();
}

class _lvl_5State extends State<lvl_5> {
  late SharedPreferences prefs;
  late List<bool> isClickedList;
  List<Widget> lessonData = [];
  List<dynamic> Lesson_Data = Lesson_data5;
  bool areAllContainersClicked = false;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    isClickedList = List.generate(Lesson_Data.length,
            (index) => prefs.getBool('container_$index') ?? false);

    // Load the state from SharedPreferences
    areAllContainersClicked = prefs.getBool('areAllContainersClicked') ?? false;

    getpostdata();
  }

  Future<void> saveAllContainersClickedState(bool state) async {
    await prefs.setBool('areAllContainersClicked', state);
  }

  void _updateClickedState(int index, bool newState) async {
    if (!isClickedList[index]) {
      await prefs.setBool('container_$index', newState);
      isClickedList[index] = newState;
      setState(() {});

      // Check if all containers are clicked
      areAllContainersClicked = isClickedList.every((clicked) => clicked);

      // Save the state to SharedPreferences
      await saveAllContainersClickedState(areAllContainersClicked);
    }
  }

  void getpostdata() {
    List<Widget> listItems = [];
    for (int index = 0; index < Lesson_Data.length; index++) {
      final element = Lesson_Data[index];
      listItems.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: InkWell(
          onTap: () {
            launch(element["URI"]);
            _updateClickedState(index, true);
          },
          child: Row(
            children: [
              Container(
                child: Center(
                  child: Text(
                    element["Name"],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                  color: isClickedList[index]
                      ? Color(0xffEBA4A4)
                      : Color(0xffFFCBB1),
                  border: Border.all(color: Color(0xff880D1E), width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(31)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
              )
            ],
          ),
        ),
      ));
    }
    setState(() {
      lessonData = listItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isClickedList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffFDE8DE),
        appBar: AppBar(
          title: Text('Level 1'),
          backgroundColor: Color(0xff880D1E),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: lessonData.length,
                itemBuilder: (context, index) {
                  return lessonData[index];
                },
              ),
            ),
            ElevatedButton(
              onPressed: areAllContainersClicked
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen(),
                  ),
                );
              }
                  : null,
              child: Text('Download PDF'),
            ),
          ],
        ),
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: 'assets/Sample.pdf', // Replace with your PDF file path
        autoSpacing: false,
        pageFling: false,
        pageSnap: false,
        swipeHorizontal: false,
      ),
    );
  }
}
