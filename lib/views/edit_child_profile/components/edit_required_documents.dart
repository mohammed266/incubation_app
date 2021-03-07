import 'package:flutter/material.dart';
import 'package:incubation_app/shared/components/components.dart';


class EditRequiredDocScreen extends StatefulWidget {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageContainer(
                onTap: () {},
                text: 'صور شخصية حديثة للطفل.',
              ),
              SizedBox(
                width: 10,
              ),
              ImageContainer(
                onTap: () {},
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
                onTap: () {},
                text: 'صورة من شهادة الميلاد',
              ),
              SizedBox(
                width: 10,
              ),
              ImageContainer(
                onTap: () {},
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
                  print('ll');
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width / 2.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Color(0xFFF5F5F5),
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
