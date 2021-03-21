import 'dart:io';

import 'package:flutter/material.dart';
import 'package:incubation_app/views/child_profile/models/child_details.dart';
import '../edit_child_controller.dart';
import '../../../shared/components/components.dart';

class EditRequiredDocScreen extends StatefulWidget {
  const EditRequiredDocScreen({
    Key key,
    this.editChildController, this.childDetailsModel,
  }) : super(key: key);

  final EditChildController editChildController;
  final ChildDetailsModel childDetailsModel;

  @override
  _EditRequiredDocScreenState createState() => _EditRequiredDocScreenState();
}

class _EditRequiredDocScreenState extends State<EditRequiredDocScreen> {
  bool _value = false;

  bool _value1 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Form(
            key: widget.editChildController.editRequiredDocumentsKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ImageContainer(
                      onTap: () {
                        widget.editChildController.childEditImage().then((value) {
                          setState(() {});
                        });
                      },
                      text: 'صور شخصية حديثة للطفل.',
                      image: widget.editChildController.childImage ?? File(""),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ImageContainer(
                      onTap: () {
                        widget.editChildController.editFamilyImage().then((value) {
                          setState(() {});
                        });
                      },
                      text: 'صورة من كرت العائلة',
                      image: widget.editChildController.familyCardImage ?? File(""),
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
                        widget.editChildController.childEditDateImage().then((value) {
                          setState(() {});
                        });
                      },
                      text: 'صورة من شهادة الميلاد',
                      image: widget.editChildController.childDateImage ?? File(""),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ImageContainer(
                      onTap: () {
                        widget.editChildController
                            .childEditVaccinationCardImage()
                            .then((value) {
                          setState(() {});
                        });
                      },
                      text: 'صورة من كرت التطعيم',
                      image: widget.editChildController.childVaccinationCardImage ??
                          File(""),
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
                        widget.editChildController
                            .childEditMedicalImage()
                            .then((value) {
                          setState(() {});
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width / 2.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Color(0xFFF5F5F5),
                          image: DecorationImage(
                            image: FileImage(
                              widget.editChildController.childMedicalImage ??
                                  File(""),
                            ),
                            fit: BoxFit.cover,
                          ),
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
                  height: 40,
                ),
              ],
            ),
          ),
          defaultButton(
            text: 'حفظ',
            function: () {

              // _showDialog();
            },
            color: Color(0xFFA6C437),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
