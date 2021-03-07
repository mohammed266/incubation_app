import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                width: double.infinity,
                height: 90,
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
                          ? MediaQuery.of(context).size.width / 4.5
                          : MediaQuery.of(context).size.width / 3.5,
                    ),
                    Text(
                      'بحث',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFECEFFF)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'اكتب بحثك هنا',
                            hintStyle: TextStyle(
                                color: Color(0xFF273370), fontSize: 12),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.search,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ),
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'ما الذى تبحث عنه ؟',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF273370),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFAAAAAA)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                  'تواصل معنا',
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xFFAAAAAA)),
                                )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFAAAAAA)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                      'السياسة والانظمة',
                                      style: TextStyle(
                                          fontSize: 10, color: Color(0xFFAAAAAA)),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFAAAAAA)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                      'اقسام المركز',
                                      style: TextStyle(
                                          fontSize: 12, color: Color(0xFFAAAAAA)),
                                    )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFAAAAAA)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                      'خدمات المركز',
                                      style: TextStyle(
                                          fontSize: 10, color: Color(0xFFAAAAAA)),
                                    ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFAAAAAA)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                      'من نحن',
                                      style: TextStyle(
                                          fontSize: 10, color: Color(0xFFAAAAAA)),
                                    ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFAAAAAA)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Text(
                                      'حصص الفنون و الأنشطة',
                                      style: TextStyle(
                                          fontSize: 10, color: Color(0xFFAAAAAA)),
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
