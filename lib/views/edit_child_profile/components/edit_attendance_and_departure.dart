import 'package:flutter/material.dart';
import 'package:incubation_app/views/child_profile/models/child_details.dart';
import '../../../shared/components/components.dart';
import '../edit_child_controller.dart';


class EditAttendanceAndDepartureScreen extends StatefulWidget {
  const EditAttendanceAndDepartureScreen({
    Key key,
    this.editChildController, this.childDetailsModel,
  }) : super(key: key);
  final EditChildController editChildController;
  final ChildDetailsModel childDetailsModel;
  @override
  _EditAttendanceAndDepartureScreenState createState() => _EditAttendanceAndDepartureScreenState();
}

class _EditAttendanceAndDepartureScreenState extends State<EditAttendanceAndDepartureScreen> {
  TextEditingController _leave1NameController = TextEditingController();
  TextEditingController _leave1PhoneController = TextEditingController();
  TextEditingController _leave1RelationController = TextEditingController();
  TextEditingController _leave2NameController = TextEditingController();
  TextEditingController _leave2PhoneController = TextEditingController();
  TextEditingController _leave2RelationController = TextEditingController();

  @override
  void initState() {
    _leave1NameController = TextEditingController(text: widget.childDetailsModel.leav1Name.value);
    _leave1PhoneController = TextEditingController(text: widget.childDetailsModel.leav1Phone.value);
    _leave1RelationController = TextEditingController(text: widget.childDetailsModel.leav1Relation.value);
    _leave2NameController = TextEditingController(text: widget.childDetailsModel.leav2Name.value);
    _leave2PhoneController = TextEditingController(text: widget.childDetailsModel.leav2Phone.value);
    _leave2RelationController = TextEditingController(text: widget.childDetailsModel.leav2Relation.value);
    setState(() {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20,top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: widget.editChildController.editAttendanceAndDepartureKey,
              child: Column(
                children: [
                  Text(
                    'الرجاء أضافة أسماء الأشخاص المسموح لهم \n بأخذ الطالب من المركز',
                    style: TextStyle(fontSize: 13, color: Color(0xFF273370),fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFF7941D),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الاسم الثلاثى',
                                style:
                                TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                controller: _leave1NameController,
                                textInputType: TextInputType.name,
                                secure: false,
                                validate: (v) {
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V) {},
                                onSave: (v) {
                                  widget.editChildController.person1AllowTakeChildThirdName=v;
                                },
                                icon: true,
                                hint: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'رقم الجوال',
                                style:
                                TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                controller: _leave1PhoneController,
                                textInputType: TextInputType.phone,
                                secure: false,
                                validate: (v) {
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V) {},
                                onSave: (v) {
                                  widget.editChildController.person1AllowTakeChildPhone=v;
                                },
                                icon: true,
                                hint: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'صلة القرابة',
                                style:
                                TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                controller: _leave1RelationController,
                                textInputType: TextInputType.text,
                                secure: false,
                                validate: (v) {
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V) {},
                                onSave: (v) {
                                  widget.editChildController.person1AllowTakeChildRelativeRelation=v;
                                },
                                icon: true,
                                hint: '',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Color(0xFFF7941D),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الاسم الثلاثى',
                                style:
                                TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                controller: _leave2NameController,
                                textInputType: TextInputType.name,
                                secure: false,
                                validate: (v) {
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V) {},
                                onSave: (v) {
                                  widget.editChildController.person2AllowTakeChildThirdName=v;
                                },
                                icon: true,
                                hint: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'رقم الجوال',
                                style:
                                TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                controller: _leave2PhoneController,
                                textInputType: TextInputType.phone,
                                secure: false,
                                validate: (v) {
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V) {},
                                onSave: (v) {
                                  widget.editChildController.person2AllowTakeChildPhone=v;
                                },
                                icon: true,
                                hint: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'صلة القرابة',
                                style:
                                TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                controller: _leave2RelationController,
                                textInputType: TextInputType.text,
                                secure: false,
                                validate: (v) {
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V) {},
                                onSave: (v) {
                                  widget.editChildController.person2AllowTakeChildRelativeRelation=v;
                                },
                                icon: true,
                                hint: '',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                final attendanceAndDepartureKey = widget
                    .editChildController.editAttendanceAndDepartureKey.currentState;
                if (!attendanceAndDepartureKey.validate()) {
                  print('unValidated');
                  return;
                }else{
                  attendanceAndDepartureKey.save();
                  print('Validated');
                }
              },
              color: Color(0xFFA6C437),
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
