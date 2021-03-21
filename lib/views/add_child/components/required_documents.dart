import 'dart:io';

import 'package:flutter/material.dart';
import 'package:incubation_app/views/add_child/add_child_controller.dart';
import 'package:incubation_app/views/home/home.dart';
import '../../../shared/components/components.dart';
import '../../menu_items/terms_and_conditions/conditions.dart';
import 'package:easy_localization/easy_localization.dart';

class RequiredDocumentsScreen extends StatefulWidget {
  const RequiredDocumentsScreen({
    Key key,
    this.onSegmentChosen,
    this.addChildController,
    this.back2,
  }) : super(key: key);

  final Function onSegmentChosen, back2;
  final AddChildController addChildController;

  @override
  _RequiredDocumentsScreenState createState() =>
      _RequiredDocumentsScreenState();
}

class _RequiredDocumentsScreenState extends State<RequiredDocumentsScreen> {
  bool _value = false;
  bool _value1 = false;
  int index = 2;
  Future<void> _showDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44),
                      ),
                      insetPadding: EdgeInsets.only(
                        right: 25,
                        left: 25,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 7,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'تم إضافة الطفل بنجاح وسيتم \n التواصل معكم لكى يتم تفعيل \n حساب الطفل',
                              style: TextStyle(
                                fontSize: EasyLocalization.of(context).locale ==
                                        Locale('en', 'US')
                                    ? 15
                                    : 17,
                                color: Color(0xFF707070),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomeScreen(
                                    homeIndex: 2,
                                  ),
                                  maintainState: false,
                                ),
                              );
                            },
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(44),
                                  bottomLeft: Radius.circular(44),
                                ),
                                color: Color(0xFFA6C437),
                              ),
                              child: Center(
                                  child: Text(
                                'الذهاب للملف الشخصي',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.7,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7941D),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Form(
        key: widget.addChildController.requiredDocumentsKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageContainer(
                  onTap: () {
                    widget.addChildController.childGetImage().then((value) {
                      setState(() {});
                    });
                  },
                  image: widget.addChildController.childImage ?? File(""),
                  text: 'صور شخصية حديثة للطفل.',
                ),
                SizedBox(
                  width: 10,
                ),
                ImageContainer(
                  onTap: () {
                    widget.addChildController.familyImage().then((value) {
                      setState(() {});
                    });
                  },
                  image: widget.addChildController.familyCardImage ?? File(""),
                  text: 'صورة من كرت العائلة',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ImageContainer(
                  onTap: () {
                    widget.addChildController.childGetDateImage().then((value) {
                      setState(() {});
                    });
                  },
                  image: widget.addChildController.childDateImage ?? File(""),
                  text: 'صورة من شهادة الميلاد',
                ),
                SizedBox(
                  width: 10,
                ),
                ImageContainer(
                  onTap: () {
                    widget.addChildController.childGetVaccinationCardImage();
                  },
                  image: widget.addChildController.childVaccinationCardImage ??
                      File(""),
                  text: 'صورة من كرت التطعيم',
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    widget.addChildController
                        .childGetMedicalImage()
                        .then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: MediaQuery.of(context).size.width / 2.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Color(0xFFF5F5F5),
                      image: DecorationImage(
                          image: FileImage(
                              widget.addChildController.childMedicalImage ??
                                  File("")),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                            child: Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF273370),
                            size: 20,
                          )),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'صورة من الشهادة الطبية للطفل',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF6A6A6A),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.addChildController.acceptTermsAndConditions =
                          !widget.addChildController.acceptTermsAndConditions;
                    });
                  },
                  child: Image.asset(
                    'assets/icons/icon22.png',
                    height: 15,
                    width: 15,
                    color:
                        widget.addChildController.acceptTermsAndConditions == true
                            ? Color(0xFFA6C437)
                            : Color(0xFFBEBEBE),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'اوافق على',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6A6A6A)),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TermsAndConditionsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'الشروط والاحكام',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFF7941D),
                          fontWeight: FontWeight.w700),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.addChildController.acceptPublishImages =
                          !widget.addChildController.acceptPublishImages;
                    });
                  },
                  child: Image.asset(
                    'assets/icons/icon22.png',
                    height: 15,
                    width: 15,
                    color: widget.addChildController.acceptPublishImages == true
                        ? Color(0xFFA6C437)
                        : Color(0xFFBEBEBE),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'اوافق على نشر صور الطفل المشترك في قنوات التواصل \n الاجتماعي والموقع والتطبيق والمنشورات الخاصة بمركز \n سوبرهيروزلاند',
                  style: TextStyle(fontSize: 12, color: Color(0xFF6A6A6A)),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: defaultButton(
                    text: 'رجوع',
                    function: () {
                      widget.back2();
                    },
                    color: Color(0xFF6A6A6A),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: defaultButton(
                    text: 'اضافة',
                    function: () {
                      final addChildController = widget.addChildController;
                      widget.addChildController.addChild(
                        context: context,
                        childName: addChildController.childName,
                        childGender: addChildController.childGender,
                        childBirth: addChildController.childBirth,
                        childRelativeRelation:
                            addChildController.childRelativeRelation,
                        childAddress: addChildController.childAddress,
                        childState: addChildController.childState,
                        childEducationLevel:
                            addChildController.childEducationLevel,
                        person1CallThirdName:
                            addChildController.person1CallThirdName,
                        person1CallPhone: addChildController.person1CallPhone,
                        person1CallRelativeRelation:
                            addChildController.person1CallRelativeRelation,
                        person2CallThirdName:
                            addChildController.person2CallThirdName,
                        person2CallPhone: addChildController.childBirth,
                        person2CallRelativeRelation:
                            addChildController.person2CallRelativeRelation,
                        person1AllowTakeChildThirdName:
                            addChildController.person1AllowTakeChildThirdName,
                        person1AllowTakeChildPhone:
                            addChildController.person1AllowTakeChildPhone,
                        person1AllowTakeChildRelativeRelation: addChildController
                            .person1AllowTakeChildRelativeRelation,
                        person2AllowTakeChildThirdName:
                            addChildController.person2AllowTakeChildThirdName,
                        person2AllowTakeChildPhone:
                            addChildController.person2AllowTakeChildPhone,
                        person2AllowTakeChildRelativeRelation: addChildController
                            .person2AllowTakeChildRelativeRelation,
                        childAllergyFood: addChildController.childAllergyFood,
                        childOtherAllergy: addChildController.childOtherAllergy,
                        childSymptomsShockAllergy:
                            addChildController.childSymptomsShockAllergy,
                        isChildWithSpecialSeeds:
                            addChildController.isChildWithSpecialSeeds,
                        childOtherDiseases: addChildController.childOtherDiseases,
                        childImage: addChildController.childImage,
                        familyCardImage: addChildController.familyCardImage,
                        childDateImage: addChildController.childDateImage,
                        childVaccinationCardImage:
                            addChildController.childVaccinationCardImage,
                        childMedicalImage: addChildController.childMedicalImage,
                        acceptTermsAndConditions:
                            addChildController.acceptTermsAndConditions,
                        acceptPublishImages:
                            addChildController.acceptPublishImages,
                      );
                      _showDialog();
                    },
                    color: Color(0xFFA6C437),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
