import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/views/login/login.dart';

class ChooseLangScreen extends StatefulWidget {
  @override
  _ChooseLangScreenState createState() => _ChooseLangScreenState();
}

class _ChooseLangScreenState extends State<ChooseLangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height* 0.2,
            ),
            Image.asset(
              'assets/icons/logo1.png',
              height: 55,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height* 0.1,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  EasyLocalization.of(context).locale = Locale('ar', 'SA');
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                  color: Color(0xFFF7941D),
                ),
                child: Center(
                    child: Text(
                  'العربية',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                  ),
                ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  EasyLocalization.of(context).locale = Locale('en', 'US');
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                  color: Colors.white,
                  border: Border.all(color: Color(0xFFC9C9C9)),
                ),
                child: Center(
                    child: Text(
                  'English',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF414141),
                      fontWeight: FontWeight.w300,
                  ),
                ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
