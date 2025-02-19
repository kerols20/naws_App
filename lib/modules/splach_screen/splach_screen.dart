import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:naws_app/main.dart';

class SplachScreen extends StatefulWidget {
   SplachScreen({super.key});
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 5),() {
      navigatorKey.currentState?.pushNamedAndRemoveUntil("/onboarding_view", (route) => false);
    },);
  }
   Duration _duration = Duration(seconds: 4);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomIn(
              duration: _duration,
          child: Center(child: Image.asset("assets/images/Frame 3 (11).png", width: size.width*0.4, height: size.height * 0.7,))),
        ],
      ),
    );
  }
}
