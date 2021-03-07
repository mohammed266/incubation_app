import 'package:flutter/material.dart';
import 'package:incubation_app/shared/components/components.dart';


class EditAttendanceAndDepartureScreen extends StatefulWidget {
  @override
  _EditAttendanceAndDepartureScreenState createState() => _EditAttendanceAndDepartureScreenState();
}

class _EditAttendanceAndDepartureScreenState extends State<EditAttendanceAndDepartureScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20,top: 20),
      child: SingleChildScrollView(
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
                          textInputType: TextInputType.name,
                          secure: false,
                          validate: (v) {},
                          onChanged: (V) {},
                          onSave: (v) {},
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
                          validate: (v) {},
                          onChanged: (V) {},
                          onSave: (v) {},
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
                          validate: (v) {},
                          onChanged: (V) {},
                          onSave: (v) {},
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
                          textInputType: TextInputType.name,
                          secure: false,
                          validate: (v) {},
                          onChanged: (V) {},
                          onSave: (v) {},
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
                          validate: (v) {},
                          onChanged: (V) {},
                          onSave: (v) {},
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
                          validate: (v) {},
                          onChanged: (V) {},
                          onSave: (v) {},
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
