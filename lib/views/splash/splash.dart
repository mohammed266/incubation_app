import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:incubation_app/shared/shared_helper.dart';
import 'package:incubation_app/views/choose_lang/choose_lang.dart';
import 'package:incubation_app/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool savedSession = false;

  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      savedSession =await SharedHelper.getSaveSession();
      if(savedSession == null)
        savedSession = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image1.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        AnimatedSplashScreen(
          duration: 5000,
          nextScreen: savedSession ? HomeScreen() : ChooseLangScreen(),
          splash: Center(
            child: Image.asset(
              'assets/icons/logo1.png',
              width: MediaQuery.of(context).size.width * 0.7,
              height: 70,
            ),
          ),
          splashTransition: SplashTransition.rotationTransition,
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
