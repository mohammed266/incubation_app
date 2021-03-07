import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
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
                    width:
                    EasyLocalization.of(context).locale == Locale('en', 'US')
                        ? MediaQuery.of(context).size.width / 5.5
                        : MediaQuery.of(context).size.width / 4.8,
                  ),
                  Text(
                    'conditions'.tr().toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/icons/icon18.png',height: 35,width: 35,),
                      SizedBox(
                        width: 8,
                      ),
                      Text('عنوان في هذا المكان',style: TextStyle(fontSize: 14,color: Color(0xFF273370)),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15,bottom: 20),
                    child: Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.',
                      style: TextStyle(fontSize: 12,color: Color(0xFFAAAAAA)),
                    ),
                  ),
                  //
                  Row(
                    children: [
                      Image.asset('assets/icons/icon18.png',height: 35,width: 35,),
                      SizedBox(
                        width: 8,
                      ),
                      Text('عنوان في هذا المكان',style: TextStyle(fontSize: 14,color: Color(0xFF273370)),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15,bottom: 20),
                    child: Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.',
                      style: TextStyle(fontSize: 12,color: Color(0xFFAAAAAA)),
                    ),
                  ),
                  //
                  Row(
                    children: [
                      Image.asset('assets/icons/icon18.png',height: 35,width: 35,),
                      SizedBox(
                        width: 8,
                      ),
                      Text('عنوان في هذا المكان',style: TextStyle(fontSize: 14,color: Color(0xFF273370)),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15,bottom: 20),
                    child: Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.',
                      style: TextStyle(fontSize: 12,color: Color(0xFFAAAAAA)),
                    ),
                  ),
                  //
                  Row(
                    children: [
                      Image.asset('assets/icons/icon18.png',height: 35,width: 35,),
                      SizedBox(
                        width: 8,
                      ),
                      Text('عنوان في هذا المكان',style: TextStyle(fontSize: 14,color: Color(0xFF273370)),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15,bottom: 20),
                    child: Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.',
                      style: TextStyle(fontSize: 12,color: Color(0xFFAAAAAA)),
                    ),
                  ),
                  //
                  Row(
                    children: [
                      Image.asset('assets/icons/icon18.png',height: 35,width: 35,),
                      SizedBox(
                        width: 8,
                      ),
                      Text('عنوان في هذا المكان',style: TextStyle(fontSize: 14,color: Color(0xFF273370)),),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15,bottom: 30),
                    child: Text('هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.',
                      style: TextStyle(fontSize: 12,color: Color(0xFFAAAAAA)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
