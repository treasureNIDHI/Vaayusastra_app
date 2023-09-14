import 'package:flutter/material.dart';
import 'Eleventofifteenlesson/lvl_1.dart';
import 'Eleventofifteenlesson/lvl_2.dart';
import 'Eleventofifteenlesson/lvl_3.dart';
import 'Eleventofifteenlesson/lvl_4.dart';
import 'Eleventofifteenlesson/lvl_5.dart';
import 'Eleventofifteenlesson/lvl_6.dart';
import 'Eleventofifteenlesson/lvl_7.dart';
import 'Eleventofifteenlesson/lvl_8.dart';
import 'Eleventofifteenlesson/lvl_9.dart';

class EleventofifteenLevel extends StatefulWidget {
  const EleventofifteenLevel({super.key});
  @override
  State<EleventofifteenLevel> createState() => _EleventofifteenLevelState();
}

class _EleventofifteenLevelState extends State<EleventofifteenLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF880D1E), // Hex color code (ARGB format)
        title: Text('Vaayusastra'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Color(0xFFFFCBB1),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: listerTile(lvlNm: "Level 1", i: 1),
          ),
          listerTile(lvlNm: "Level 2", i: 2),
          listerTile(lvlNm: "Level 3", i: 3),
          listerTile(lvlNm: "Level 4", i: 4),
          listerTile(lvlNm: "Level 5", i: 5),
          listerTile(lvlNm: "Level 6", i: 6),
          listerTile(lvlNm: "Level 7", i: 7),
          listerTile(lvlNm: "Level 8", i: 8),
          listerTile(lvlNm: "Level 9", i: 9)
        ],
      ),
    );
  }
}

class listerTile extends StatelessWidget {
  final String lvlNm;
  final int i;
  const listerTile({super.key, required this.lvlNm, required this.i});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
      child: ListTile(
        onTap: () {
          switch (i) {
            case 1:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lvl_1()));
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lvl_2()));
            case 3:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lvl_3()));
            case 4:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lvl_4()));
            case 5:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lvl_5()));
            case 6:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lvl_6()));
            case 7:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lvl_7()));
            case 8:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lvl_8()));
            case 9:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => lvl_9()));
          }
        },
        tileColor: Color(0xFF880D1E),
        title: Center(
            child: Text(
          lvlNm,
          style: TextStyle(fontSize: 20),
        )),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
