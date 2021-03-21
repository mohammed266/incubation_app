import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../child_profile/models/child_details.dart';
import 'edit_child_controller.dart';
import 'components/edit_attendance_and_departure.dart';
import 'components/edit_child_info.dart';
import 'components/edit_medical_info.dart';
import 'components/edit_required_documents.dart';



class EditChildProfileScreen extends StatefulWidget {
  final ChildDetailsModel childDetailsModel;

  const EditChildProfileScreen({Key key, this.childDetailsModel}) : super(key: key);

  @override
  _EditChildProfileScreenState createState() => _EditChildProfileScreenState();
}

class _EditChildProfileScreenState extends State<EditChildProfileScreen> {
  ScrollController _controller = ScrollController(keepScrollOffset: true);
  ScrollController controller = ScrollController(initialScrollOffset: 0.0);
  EditChildController editChildController = EditChildController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> listScreens = [
      // BabyInformationScreen(
      //   onSegmentChosen: () {
      //     setState(() {
      //       currentIndex = 1;
      //     });
      //     controller.animateTo(0,
      //         curve: Curves.elasticInOut,
      //         duration: Duration(microseconds: 1000));
      //   },
      // ),
      // AttendanceAndDepartureScreen(
      //   forward: () {
      //     setState(() {
      //       currentIndex = 2;
      //     });
      //     controller.animateTo(0,
      //         curve: Curves.elasticInOut,
      //         duration: Duration(microseconds: 1000));
      //   },
      //   back: () {
      //     setState(() {
      //       currentIndex--;
      //     });
      //   },
      // ),
      // MedicalInformationScreen(
      //   forward1: () {
      //     setState(() {
      //       currentIndex = 3;
      //     });
      //     controller.animateTo(0,
      //         curve: Curves.elasticInOut,
      //         duration: Duration(microseconds: 1000));
      //     _controller.jumpTo(100);
      //   },
      //   back1: () {
      //     setState(() {
      //       currentIndex--;
      //     });
      //     _controller.jumpTo(100);
      //   },
      // ),
      // RequiredDocumentsScreen(
      //   // onSegmentChosen: (){
      //   //   _controller.jumpTo(100);
      //   // },
      //   back2: (){
      //     setState(() {
      //       currentIndex--;
      //     });
      //   },
      // ),
      EditChildInfoScreen(
        editChildController: editChildController,
        childDetailsModel: widget.childDetailsModel,
      ),
      EditAttendanceAndDepartureScreen(
        editChildController: editChildController,
        childDetailsModel: widget.childDetailsModel,
      ),
      EditMedicalInfoScreen(
        editChildController: editChildController,
        childDetailsModel: widget.childDetailsModel,
      ),
      EditRequiredDocScreen(
        editChildController: editChildController,
        childDetailsModel: widget.childDetailsModel,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  color: Color(0xFF273370),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          ? MediaQuery.of(context).size.width / 3.3
                          : MediaQuery.of(context).size.width / 4.7,
                    ),
                    Text(
                      'تعديل بيانات الطفل',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: 40,
                  child: ListView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: currentIndex == 0 ? Color(0xFFF7941D) : Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                                'معلومات الطفل',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: currentIndex == 0 ? Color(0xFFF7941D) : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 1;
                          });
                          _controller.jumpTo(100);
                          controller.animateTo(0,
                              curve: Curves.elasticInOut,
                              duration: Duration(microseconds: 1000));
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: currentIndex == 1 ? Color(0xFFF7941D) : Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                                'الحضور والانصراف',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: currentIndex == 1 ? Color(0xFFF7941D) : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                          });
                          _controller.jumpTo(150);
                          controller.animateTo(0,
                              curve: Curves.elasticInOut,
                              duration: Duration(microseconds: 1000));
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: currentIndex == 2 ? Color(0xFFF7941D) : Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                                'معلومات طبية',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: currentIndex == 2 ? Color(0xFFF7941D) : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 3;
                          });
                          // _controller.jumpTo(200);
                          controller.animateTo(0,
                              curve: Curves.elasticInOut,
                              duration: Duration(microseconds: 1000));
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: currentIndex == 3 ? Color(0xFFF7941D) : Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                                'المستندات المطلوبه',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: currentIndex == 3 ? Color(0xFFF7941D) : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                   controller: controller,
                  child: listScreens[currentIndex],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
