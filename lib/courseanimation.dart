import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'fivet0SevenLEsson.dart';
import 'EighttoTenLesson.dart';
import 'Eleventofifteenles.dart';

class Courseanimation extends StatefulWidget {
  final String page;
  const Courseanimation({
    required this.page,
    super.key,
  });

  @override
  State<Courseanimation> createState() => _CourseanimationState();
}

class _CourseanimationState extends State<Courseanimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Lottie.asset(
            'assets/Courseanimation.json',
            fit: BoxFit.cover,
            controller: _controller,
            onLoaded: (compos) {
              _controller
                ..duration = compos.duration
                ..forward().then((value) {
                  if (widget.page == "1") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => fivetoSevenLevel()));
                  } else if (widget.page == "2") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => eigtotenLevel()));
                  } else if (widget.page == "3") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EleventofifteenLevel()));
                  }
                });
            },
          ),
        ),
      ),
    );
  }
}
