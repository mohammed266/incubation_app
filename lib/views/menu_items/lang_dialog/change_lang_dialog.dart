import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';




Future<void> showDialog1(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState){
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height* .3),
                Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44),
                  ),
                  insetPadding: EdgeInsets.only(
                    right: 25,
                    left: 25,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height* 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height/ 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              EasyLocalization.of(context).locale = Locale('ar', 'SA');
                            });
                            Navigator.pop(context);
                          },
                          child: Text('اللغة العربية',
                            style: TextStyle(
                              fontSize: 15,
                              color:
                              EasyLocalization.of(context).locale == Locale('ar', 'SA')
                                  ? Color(0xFFF7941D)
                                  : Color(0xFFBEBEBE),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Divider(),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              EasyLocalization.of(context).locale = Locale('en', 'US');
                            });
                            Navigator.pop(context);
                          },
                          child: Text('ENGLISH',
                            style: TextStyle(
                              fontSize: 15,
                              color: EasyLocalization.of(context).locale == Locale('en', 'US')
                                  ? Color(0xFFF7941D)
                                  : Color(0xFFBEBEBE),
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}