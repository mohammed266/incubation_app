import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:incubation_app/views/child_profile/models/child_details.dart';
import '../edit_child_controller.dart';
import '../../../shared/components/components.dart';


class EditChildInfoScreen extends StatefulWidget {
  const EditChildInfoScreen({
    Key key,
    this.editChildController, this.childDetailsModel,
  }) : super(key: key);
  final EditChildController editChildController;
  final ChildDetailsModel childDetailsModel;
  @override
  _EditChildInfoScreenState createState() => _EditChildInfoScreenState();
}

class _EditChildInfoScreenState extends State<EditChildInfoScreen> {
  List<String> genderList = ['ذكر', 'أنثى'];
  List<String> childStateList = [' لا', 'نعم'];
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _relativeRelationController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _lStageController = TextEditingController();
  TextEditingController _person1NameController = TextEditingController();
  TextEditingController _person1PhoneController = TextEditingController();
  TextEditingController _person1RelationController = TextEditingController();
  TextEditingController _person2NameController = TextEditingController();
  TextEditingController _person2PhoneController = TextEditingController();
  TextEditingController _person2RelationController = TextEditingController();

  @override
  void initState() {
    _userNameController = TextEditingController(text: widget.childDetailsModel.childThirdName.value);
    _relativeRelationController = TextEditingController(text: widget.childDetailsModel.relation.value);
    _addressController = TextEditingController(text: widget.childDetailsModel.adress.value);
    _lStageController = TextEditingController(text: widget.childDetailsModel.lStage.value);
    _person1NameController = TextEditingController(text: widget.childDetailsModel.contact1Name.value);
    _person1PhoneController = TextEditingController(text: widget.childDetailsModel.contact1Phone.value);
    _person1RelationController = TextEditingController(text: widget.childDetailsModel.contact1Relation.value);
    _person2NameController = TextEditingController(text: widget.childDetailsModel.contact2Name.value);
    _person2PhoneController = TextEditingController(text: widget.childDetailsModel.contact2Phone.value);
    _person2RelationController = TextEditingController(text: widget.childDetailsModel.contact2Relation.value.toString());

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
              key: widget.editChildController.editChildInformationKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اسم الطفل الثلاثى',
                          style:
                          TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        inputField(
                          controller: _userNameController,
                          textInputType: TextInputType.name,
                          secure: false,
                          validate: (v){
                            if (v.toString().isEmpty) {
                              return '';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (V){},
                          onSave: (v){
                            widget.editChildController.childName = v;
                          },
                          icon: true,
                          hint: 'محمد أنور عبد المنصف',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'الجنس',
                          style:
                          TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 15, right: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: DropdownButton<String>(
                            underline: Text(''),
                            elevation: 0,
                            items: genderList.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                widget.editChildController.childGender = newValue;
                              });
                            },
                            value: widget.editChildController.childGender,
                            isExpanded: true,
                            hint: Text(
                              'اختر جنس الطفل',
                              style: TextStyle(fontSize: 12, color: Color(0xFFBFBFBF)),
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'تاريخ الميلاد',
                          style:
                          TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity,
                          height: 45,
                          padding: EdgeInsets.only(left: 15, right: 15,bottom: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: DateTimePicker(
                            initialValue: '',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            // dateLabelText: '20/12/2020',
                            onChanged: (val) => print(val),
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) {
                              widget.editChildController.childBirth = val;
                            },
                            icon: Icon(Icons.event,color: Colors.grey,),
                            type: DateTimePickerType.date,
                            style: TextStyle(fontSize: 13),
                            decoration: InputDecoration(
                              hintText: '20/12/2020',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFBFBFBF),
                              ),
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
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
                          controller: _relativeRelationController,
                          textInputType: TextInputType.name,
                          secure: false,
                          validate: (v){
                            if (v.toString().isEmpty) {
                              return '';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (V){},
                          onSave: (v){
                            widget.editChildController.childRelativeRelation = v;
                          },
                          icon: true,
                          hint: 'ام',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'عنوان المنزل',
                          style:
                          TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        inputField(
                          controller: _addressController,
                          textInputType: TextInputType.streetAddress,
                          secure: false,
                          validate: (v){
                            if (v.toString().isEmpty) {
                              return '';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (V){},
                          onSave: (v){
                            widget.editChildController.childAddress = v;
                          },
                          icon: true,
                          hint: 'الحي - الشارع',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'هل طفل مسجل في مدرسة',
                          style:
                          TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 45,
                          padding: EdgeInsets.only(left: 15, right: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: DropdownButton<String>(
                            underline: Text(''),
                            elevation: 0,
                            items: childStateList.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                widget.editChildController.childState = newValue;
                              });
                            },
                            value: widget.editChildController.childState,
                            isExpanded: true,
                            hint: Text(
                              'نعم',
                              style: TextStyle(fontSize: 12, color: Color(0xFFBFBFBF)),
                            ),

                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'المرحلة الدراسية',
                          style:
                          TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        inputField(
                          controller: _lStageController,
                          textInputType: TextInputType.text,
                          secure: false,
                          validate: (v){
                            if (v.toString().isEmpty) {
                              return '';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (V){},
                          onSave: (v){
                            widget.editChildController.childEducationLevel = v;
                          },
                          icon: true,
                          hint: 'اكتب المرحلة الدراسية',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('الرجاء اضافة شخصين في قائمة الاتصال للحالات الطارئة',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF273370),
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
                          child: Center(child: Text('1',style: TextStyle(color: Colors.white,fontSize: 13),)),
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
                                controller: _person1NameController,
                                textInputType: TextInputType.name,
                                secure: false,
                                validate: (v){
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V){},
                                onSave: (v){
                                  widget.editChildController.person1CallThirdName = v;
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
                                controller: _person1PhoneController,
                                textInputType: TextInputType.phone,
                                secure: false,
                                validate: (v){
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V){},
                                onSave: (v){
                                  widget.editChildController.person1CallPhone=v;
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
                                controller: _person1RelationController,
                                textInputType: TextInputType.text,
                                secure: false,
                                validate: (v){
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V){},
                                onSave: (v){
                                  widget.editChildController.person1CallRelativeRelation=v;
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
                          child: Center(child: Text('2',style: TextStyle(color: Colors.white,fontSize: 13),)),
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
                                controller: _person2NameController,
                                textInputType: TextInputType.name,
                                secure: false,
                                validate: (v){
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V){},
                                onSave: (v){
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
                                controller: _person2PhoneController,
                                textInputType: TextInputType.phone,
                                secure: false,
                                validate: (v){
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V){},
                                onSave: (v){
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
                                controller: _person2RelationController,
                                textInputType: TextInputType.text,
                                secure: false,
                                validate: (v){
                                  if (v.toString().isEmpty) {
                                    return '';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (V){},
                                onSave: (v){
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
                    height: 25,
                  ),
                ],
              ),
            ),
            defaultButton(
              text: 'حفظ',
              function: () {
                final babyInformationKey = widget
                    .editChildController.editChildInformationKey.currentState;
                if (!babyInformationKey.validate()) {
                  print('unValidated');
                  return;
                }else{
                  babyInformationKey.save();
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
