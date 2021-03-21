import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/views/child_profile/controllers/child_details.dart';
import 'package:incubation_app/views/child_profile/models/child_details.dart';
import '../edit_child_profile/edit_child_profile.dart';
import 'components/messages.dart';
import 'components/reports.dart';
import '../../shared/components/components.dart';
import 'components/images.dart';

class ChildProfileScreen extends StatefulWidget {
  ChildProfileScreen(
      {Key key,this.id})
      : super(key: key);
  var id;
  @override
  _ChildProfileScreenState createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen> {
  int _currentIndex = 0;
  bool _isLoading = true;
  ChildDetailsModel _childDetailsModel;

  initState(){
    getInfo();
    super.initState();
  }

  getInfo()async{
    _childDetailsModel = await ChildDetailsController().getDetails(widget.id);
    setState(()=> _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> listScreen = [
      ImagesScreen(),
      ReportsScreen(),
      MessagesScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _isLoading ? Text('Loading') : SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 270,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                      color: Color(0xFF273370),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: EasyLocalization.of(context).locale ==
                                  Locale('en', 'US')
                              ? MediaQuery.of(context).size.width / 4.5
                              : MediaQuery.of(context).size.width / 3.5,
                        ),
                        Text(
                          'اسم الطفل',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Stack(
                      children: [
                        Container(
                          height: 220,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              height: 190,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFF7941D),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    '‏5 سنوات',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'الصف الدراسي',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            'الأول الابتدائي',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 35,
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'اسم المعلمة',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            'اسم المعلمة يكتب هنا',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  defaultButton(
                                    text: 'تعديل ملف الطفل',
                                    function: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              EditChildProfileScreen(childDetailsModel: _childDetailsModel,),
                                        ),
                                      );
                                    },
                                    color: Colors.black.withOpacity(0.05),
                                    r: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: MediaQuery.of(context).size.width / 2.65,
                          child: Container(
                            padding: EdgeInsets.all(3),
                            margin: EdgeInsets.all(8),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Color(0xFF273370),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/image4.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF273370),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الصور',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: _currentIndex == 0
                                      ? Color(0xFFA6C437)
                                      : Colors.white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: _currentIndex == 0
                                    ? Color(0xFFA6C437)
                                    : Color(0xFF273370),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 1,
                        color: Colors.white,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'التقارير',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: _currentIndex == 1
                                      ? Color(0xFFA6C437)
                                      : Colors.white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: _currentIndex == 1
                                    ? Color(0xFFA6C437)
                                    : Color(0xFF273370),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 1,
                        color: Colors.white,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'الرسائل',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: _currentIndex == 2
                                      ? Color(0xFFA6C437)
                                      : Colors.white),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: _currentIndex == 2
                                    ? Color(0xFFA6C437)
                                    : Color(0xFF273370),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: listScreen[_currentIndex],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
