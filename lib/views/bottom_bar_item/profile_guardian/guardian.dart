import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/shared/components/components.dart';

class GuardianScreen extends StatelessWidget {
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
                    height: 270,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                      color: Color(0xFF273370),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //
                          },
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'profile'.tr().toString(),
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            //
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF7941D),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.all(8),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFFF7941D),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/images/image4.png'),
                              ),
                            ),
                            Text('اسم الام او الاب',style: TextStyle(color: Colors.white,fontSize: 13),),
                            Text('010254652155',style: TextStyle(color: Colors.white,fontSize: 10),),
                            Spacer(),
                            defaultButton(
                              text: 'تعديل الملف الشخصي',
                              function: (){},
                              color: Colors.black.withOpacity(0.05),
                              r: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: defaultButton(
                    text: 'إضافة طفل',
                    function: (){
                      //
                    },
                    color: Color(0xFFA6C437),
                    r: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
