import 'package:flutter/material.dart';
import 'package:incubation_app/views/child_profile/models/child_details.dart';
import 'package:incubation_app/views/edit_child_profile/edit_child_controller.dart';
import '../../../shared/components/components.dart';


class EditMedicalInfoScreen extends StatefulWidget {
  const EditMedicalInfoScreen({
    Key key,
    this.editChildController, this.childDetailsModel,
  }) : super(key: key);
  final EditChildController editChildController;
  final ChildDetailsModel childDetailsModel;
  @override
  _EditMedicalInfoScreenState createState() => _EditMedicalInfoScreenState();
}

class _EditMedicalInfoScreenState extends State<EditMedicalInfoScreen> {
  // bool _value;
  // bool _value1;
  // bool _value2;
  // bool _value3;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: widget.editChildController.editMedicalInformationKey,
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
                          'هل يعاني الطالب من الحساسية الغذائية',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6A6A6A),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.editChildController.childAllergyFood = true;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: widget.editChildController.childAllergyFood == true ? Color(0xFFF7941D) : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                        'نعم',
                                        style:
                                        TextStyle(color: widget.editChildController.childAllergyFood == true ?  Color(0xFFF7941D) : Color(0xFFBEBEBE), fontSize: 12),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.editChildController.childAllergyFood = false;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: widget.editChildController.childAllergyFood == false ? Color(0xFFF7941D) : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'لا',
                                      style:
                                      TextStyle(
                                        color: widget.editChildController.childAllergyFood == false ? Color(0xFFF7941D) : Color(0xFFBEBEBE) ,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'هل يعاني الطالب من أي نوع آخر من الحساسية',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6A6A6A),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.editChildController.childOtherAllergy = true;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: widget.editChildController.childOtherAllergy == true ? Color(0xFFF7941D) : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                        'نعم',
                                        style:
                                        TextStyle(color: widget.editChildController.childOtherAllergy == true ?  Color(0xFFF7941D) : Color(0xFFBEBEBE), fontSize: 12),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.editChildController.childOtherAllergy = false;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: widget.editChildController.childOtherAllergy == false ? Color(0xFFF7941D) : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'لا',
                                      style:
                                      TextStyle(
                                        color: widget.editChildController.childOtherAllergy == false ? Color(0xFFF7941D) : Color(0xFFBEBEBE) ,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'في حال تعرض الطالب لإحدى مسببات الحساسية هل يتطلب استخدام حقنة الأدرينالين (الإبينفرين)، في حالة الطوارئ، أي عند ظهور أي عرض من أعراض صدمة الحساسية',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6A6A6A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.editChildController.childSymptomsShockAllergy = true;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: widget.editChildController.childSymptomsShockAllergy == true ? Color(0xFFF7941D) : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                        'نعم',
                                        style:
                                        TextStyle(color: widget.editChildController.childSymptomsShockAllergy == true ?  Color(0xFFF7941D) : Color(0xFFBEBEBE), fontSize: 12),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.editChildController.childSymptomsShockAllergy = false;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: widget.editChildController.childSymptomsShockAllergy == false ? Color(0xFFF7941D) : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'لا',
                                      style:
                                      TextStyle(
                                        color: widget.editChildController.childSymptomsShockAllergy == false ? Color(0xFFF7941D) : Color(0xFFBEBEBE) ,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'هل الطالب من ذوي الاحتياجات الخاصة',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6A6A6A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.editChildController.isChildWithSpecialSeeds = true;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: widget.editChildController.isChildWithSpecialSeeds == true ? Color(0xFFF7941D) : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                        'نعم',
                                        style:
                                        TextStyle(color: widget.editChildController.isChildWithSpecialSeeds == true ?  Color(0xFFF7941D) : Color(0xFFBEBEBE), fontSize: 12),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.editChildController.isChildWithSpecialSeeds = false;
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: widget.editChildController.isChildWithSpecialSeeds == false ? Color(0xFFF7941D) : Colors.white,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'لا',
                                      style:
                                      TextStyle(
                                        color: widget.editChildController.isChildWithSpecialSeeds == false ? Color(0xFFF7941D) : Color(0xFFBEBEBE) ,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'الرجاء كتابة أي أعراض صحية يعاني منها الطالب',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6A6A6A),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onSaved: (v){
                              widget.editChildController.childOtherDiseases= v;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                            maxLines: 4,
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
                final editMedialInformationKey =  widget.editChildController.editMedicalInformationKey.currentState;

                if(editMedialInformationKey.validate())
                {
                  editMedialInformationKey.save();
                  print('validate');
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
