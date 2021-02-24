import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../bottom_bar_item/home/home1.dart';
import '../bottom_bar_item/menu/menu.dart';
import '../bottom_bar_item/photo_gallery/gallery.dart';
import '../bottom_bar_item/profile_guardian/guardian.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Home1Screen(),
    GalleryScreen(),
    GuardianScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
             color: Color(0xFFF8F8F8),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            currentIndex: _currentIndex,
            onTap: (value) {
              _currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 29,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: _currentIndex == 0 ? Color(0xFFF7941D) : Colors.white,
                          ),
                        ),
                        child: Image.asset(
                          'assets/icons/icon5.png',
                          color: _currentIndex == 0 ? Color(0xFFF7941D) : Color(0xFFBEBEBE),
                        ),
                      ),
                      if(_currentIndex == 0) Positioned(
                        bottom: 0,
                        right: 5,
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/icons/icon9.png',fit: BoxFit.fill,),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 29,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: _currentIndex == 1 ? Color(0xFFF7941D) : Colors.white,
                          ),
                        ),
                        child: Image.asset(
                          'assets/icons/icon6.png',
                          color: _currentIndex == 1 ? Color(0xFFF7941D) : Color(0xFFBEBEBE),
                        ),
                      ),
                      if(_currentIndex == 1) Positioned(
                        bottom: 0,
                        right: 5,
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/icons/icon9.png',fit: BoxFit.fill,),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 29,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: _currentIndex == 2 ? Color(0xFFF7941D) : Colors.white,
                          ),
                        ),
                        child: Image.asset(
                          'assets/icons/icon7.png',
                          color: _currentIndex == 2 ? Color(0xFFF7941D) : Color(0xFFBEBEBE),
                        ),
                      ),
                      if(_currentIndex == 2) Positioned(
                        bottom: 0,
                        right: 5,
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/icons/icon9.png',fit: BoxFit.fill,),
                        ),
                      ),
                    ],
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Container(
                        height: 40,
                        width: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 29,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: _currentIndex == 3 ? Color(0xFFF7941D) : Colors.white,
                          ),
                        ),
                        child: Image.asset(
                          'assets/icons/icon8.png',
                          color: _currentIndex == 3 ? Color(0xFFF7941D) : Color(0xFFBEBEBE),
                        ),
                      ),
                      if(_currentIndex == 3) Positioned(
                        bottom: 0,
                        right: 5,
                        child: Container(
                          height: 20,
                          width: 20,
                          child: Image.asset('assets/icons/icon9.png',fit: BoxFit.fill,),
                        ),
                      ),
                    ],
                  ),
                ),
                label: ''
              ),
            ],
          ),
        ),
        body: _children[_currentIndex],
      ),
    );
  }
}
