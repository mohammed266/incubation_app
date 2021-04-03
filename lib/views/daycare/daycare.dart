import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../shared/components/components.dart';
import '../book_service/book_service.dart';
import '../menu_items/center_classes/center_classes_model.dart';


class DaycareScreen extends StatelessWidget {
  DaycareScreen({this.classDetails});
  CenterClassesModel classDetails;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            : MediaQuery.of(context).size.width / 4.2,
                      ),
                      Text(
                        'daycare'.tr().toString(),
                        style: TextStyle(fontSize: 15, color: Colors.white),
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
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(classDetails.img),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text('${classDetails.content}',style: TextStyle(fontSize: 12,color: Color(0xFF273370)),),
                    // HtmlWidget(classDetails.content),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 30),
                  //   child: Text('في فصول سوبرهيروز لاند كل يوم مليء بأنشطة مصممة حول ستة مجالات تطوير رئيسية لطفلك :',
                  //     style: TextStyle(fontSize: 13,color: Color(0xFFF7941D)),
                  //   ),
                  // ),
                  // Text('١ - تطوير المهارات اللغوية  Language development',
                  //   style: TextStyle(fontSize: 12,color: Color()),
                  // ),
                  // Text('٢ - الوظائف التنفيذية Executive Function',
                  //   style: TextStyle(fontSize: 12,color: Color(0xFF273370)),
                  // ),
                  // Text('٣ - التنمية الاجتماعية والعاطفية Social and Emotional',
                  //   style: TextStyle(fontSize: 12,color: Color(0xFF273370)),
                  // ),
                  // Text('٤ - التنمية البدنية والصحي Development Physical Development and Wellness',
                  //   style: TextStyle(fontSize: 12,color: Color(0xFF273370)),
                  // ),
                  // Text('٥ - التطور المعرفي Cognitive Development',
                  //     style: TextStyle(fontSize: 12,color: Color(0xFF273370)),
                  // ),
                  // Text('٦- التعبير الإبداعي Creative Expression',
                  //   style: TextStyle(fontSize: 12,color: Color(0xFF273370)),
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  defaultButton(
                    color: Color(0xFFA6C437),
                    function: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (_)=> BookServiceScreen(),
                        ),
                      );
                    },
                    text: 'حجز الخدمة',
                  ),
                  SizedBox(
                    height: 30,
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
