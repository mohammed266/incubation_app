import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../shared/components/components.dart';

class EditGuardianProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 155,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Color(0xFF273370),
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
                              ? MediaQuery.of(context).size.width / 5
                              : MediaQuery.of(context).size.width / 5.2,
                        ),
                        Text(
                          'تعديل الملف الشخصي',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(1),
                          margin: EdgeInsets.all(5),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(-1, 2),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/image4.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('ll');
                          },
                          child: Text(
                            'اضغط لتغير الصورة',
                            style:
                                TextStyle(fontSize: 11, color: Color(0xFF273370)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اسم ولى الامر ثلاثي',
                      style: TextStyle(fontSize: 15, color: Color(0xFF6A6A6A)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    inputField(
                      onChanged: (v) {},
                      onSave: (value){},
                      secure: false,
                      validate: (value){},
                      textInputType: TextInputType.name,
                      icon: true,
                      hint: 'خديجة عبد الله',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'رقم الجوال',
                      style: TextStyle(fontSize: 15, color: Color(0xFF6A6A6A)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    inputField(
                      onChanged: (v) {},
                      onSave: (value){},
                      secure: false,
                      validate: (value){},
                      textInputType: TextInputType.phone,
                      icon: true,
                      hint: '55326584856',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'البريد الالكترونى',
                      style: TextStyle(fontSize: 15, color: Color(0xFF6A6A6A)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    inputField(
                      onChanged: (v) {},
                      onSave: (value){},
                      secure: false,
                      validate: (value){},
                      textInputType: TextInputType.emailAddress,
                      icon: true,
                      hint: 'person mail @g-mail.com',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'العنوان',
                      style: TextStyle(fontSize: 15, color: Color(0xFF6A6A6A)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    inputField(
                      onChanged: (v) {},
                      onSave: (value){},
                      secure: false,
                      validate: (value){},
                      textInputType: TextInputType.streetAddress,
                      icon: true,
                      hint: 'العنوان يكتب هنا',
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    defaultButton(
                      color: Color(0xFFA6C437),
                      text: 'حفظ',
                      function: (){

                      },
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
      ),
    );
  }
}
