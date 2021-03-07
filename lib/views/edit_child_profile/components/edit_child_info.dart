import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import '../../../shared/components/components.dart';


class EditChildInfoScreen extends StatefulWidget {
  @override
  _EditChildInfoScreenState createState() => _EditChildInfoScreenState();
}

class _EditChildInfoScreenState extends State<EditChildInfoScreen> {
  List<String> date = ['ذكر','أنثى'];

  List<String> date1 = [' لا','نعم'];

  String _newValue;

  String _newValue1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20,top: 20),
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
                    'اسم الطفل الثلاثى',
                    style:
                    TextStyle(fontSize: 13, color: Color(0xFF6A6A6A)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  inputField(
                    textInputType: TextInputType.name,
                    secure: false,
                    validate: (v){},
                    onChanged: (V){},
                    onSave: (v){},
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
                      items: date.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _newValue = newValue;
                        });
                      },
                      value: _newValue,
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
                      onSaved: (val) => print(val),
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
                    textInputType: TextInputType.name,
                    secure: false,
                    validate: (v){},
                    onChanged: (V){},
                    onSave: (v){},
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
                    textInputType: TextInputType.streetAddress,
                    secure: false,
                    validate: (v){},
                    onChanged: (V){},
                    onSave: (v){},
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
                      items: date1.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _newValue1 = newValue;
                        });
                      },
                      value: _newValue1,
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
                    textInputType: TextInputType.text,
                    secure: false,
                    validate: (v){},
                    onChanged: (V){},
                    onSave: (v){},
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
                          textInputType: TextInputType.name,
                          secure: false,
                          validate: (v){},
                          onChanged: (V){},
                          onSave: (v){},
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
                          textInputType: TextInputType.phone,
                          secure: false,
                          validate: (v){},
                          onChanged: (V){},
                          onSave: (v){},
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
                          textInputType: TextInputType.text,
                          secure: false,
                          validate: (v){},
                          onChanged: (V){},
                          onSave: (v){},
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
                          textInputType: TextInputType.name,
                          secure: false,
                          validate: (v){},
                          onChanged: (V){},
                          onSave: (v){},
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
                          textInputType: TextInputType.phone,
                          secure: false,
                          validate: (v){},
                          onChanged: (V){},
                          onSave: (v){},
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
                          textInputType: TextInputType.text,
                          secure: false,
                          validate: (v){},
                          onChanged: (V){},
                          onSave: (v){},
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
      ),
    );
  }
}
