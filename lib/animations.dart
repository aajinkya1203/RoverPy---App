import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:sign_in/auth/login.dart';

class AuthDemo extends StatefulWidget {
  @override
  _AuthDemoState createState() => _AuthDemoState();
}

class _AuthDemoState extends State<AuthDemo> with SingleTickerProviderStateMixin{

  String _animationName = "Flow";
  Animation<Offset> classificationAnimation;
  Animation<Offset> exitAnimation;
  AnimationController controller;
  Animation<Offset> switcher;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 3000),
        vsync: this
    );
    classificationAnimation = Tween<Offset>(
      begin: Offset(6.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          0.7,
          curve: Curves.easeOut,
        ),
      ),
    );
    exitAnimation = Tween<Offset>(
      end: Offset(-6.0, 0.0),
      begin: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.5,
          0.7,
          curve: Curves.easeOut,
        ),
      ),
    );
    switcher = classificationAnimation;
  }
  void changeAnimation(){
    setState(() {
      if(switcher == classificationAnimation){
        switcher = exitAnimation;
      }else{
        switcher = classificationAnimation;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FlareActor(
            'assets/background.flr',
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            animation: _animationName,
            callback: (String val){
              setState(() {
                _animationName = "Flow";
              });
            },
          ),
          SlideTransition(
            position: switcher,
            child: Container(
              alignment: Alignment.center,
              child: LoginScreen(changeAnimation: changeAnimation),
            ),
          ),
        ],
        overflow: Overflow.clip,
      ),
    );
  }
}