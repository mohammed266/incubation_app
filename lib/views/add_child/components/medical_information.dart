import 'package:flutter/material.dart';
import '../../../shared/components/components.dart';

class MedicalInformationScreen extends StatefulWidget {
  const MedicalInformationScreen({
    Key key,
    this.back1,
    this.forward1,
  }) : super(key: key);

  final Function back1, forward1;

  @override
  _MedicalInformationScreenState createState() =>
      _MedicalInformationScreenState();
}

class _MedicalInformationScreenState extends State<MedicalInformationScreen> {
  bool _value = true;
  bool _value1 = true;
  bool _value2 = true;
  bool _value3 = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SingleChildScrollView(
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
                              _value = true;
                            });
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:_value == true ? Color(0xFFF7941D) : Colors.white,
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'نعم',
                              style:
                                  TextStyle(color: _value == true ?  Color(0xFFF7941D) : Color(0xFFBEBEBE), fontSize: 12),
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
                              _value = false;
                            });
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: _value == false ? Color(0xFFF7941D) : Colors.white,
                              ),
                            ),
                            child: Center(
                                child: Text(
                                  'لا',
                                  style:
                                  TextStyle(
                                      color: _value == false ? Color(0xFFF7941D) : Color(0xFFBEBEBE) ,
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
                              _value1 = true;
                            });
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:_value1 == true ? Color(0xFFF7941D) : Colors.white,
                              ),
                            ),
                            child: Center(
                                child: Text(
                                  'نعم',
                                  style:
                                  TextStyle(color: _value1 == true ?  Color(0xFFF7941D) : Color(0xFFBEBEBE), fontSize: 12),
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
                              _value1 = false;
                            });
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: _value1 == false ? Color(0xFFF7941D) : Colors.white,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'لا',
                                style:
                                TextStyle(
                                  color: _value1 == false ? Color(0xFFF7941D) : Color(0xFFBEBEBE) ,
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
                              _value2 = true;
                            });
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:_value2 == true ? Color(0xFFF7941D) : Colors.white,
                              ),
                            ),
                            child: Center(
                                child: Text(
                                  'نعم',
                                  style:
                                  TextStyle(color: _value2 == true ?  Color(0xFFF7941D) : Color(0xFFBEBEBE), fontSize: 12),
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
                              _value2 = false;
                            });
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: _value2 == false ? Color(0xFFF7941D) : Colors.white,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'لا',
                                style:
                                TextStyle(
                                  color: _value2 == false ? Color(0xFFF7941D) : Color(0xFFBEBEBE) ,
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
                              _value3 = true;
                            });
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:_value3 == true ? Color(0xFFF7941D) : Colors.white,
                              ),
                            ),
                            child: Center(
                                child: Text(
                                  'نعم',
                                  style:
                                  TextStyle(color: _value3 == true ?  Color(0xFFF7941D) : Color(0xFFBEBEBE), fontSize: 12),
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
                              _value3 = false;
                            });
                          },
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: _value3 == false ? Color(0xFFF7941D) : Colors.white,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'لا',
                                style:
                                TextStyle(
                                  color: _value3 == false ? Color(0xFFF7941D) : Color(0xFFBEBEBE) ,
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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
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
            Row(
              children: [
                Expanded(
                  child: defaultButton(
                    text: 'رجوع',
                    function: (){
                      widget.back1();
                    },
                    color: Color(0xFF6A6A6A),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: defaultButton(
                    text: 'استمرار',
                    function: (){
                      widget.forward1();
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
