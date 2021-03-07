import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/views/daycare/daycare.dart';


class CenterClassesScreen extends StatelessWidget {
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
                    width: EasyLocalization.of(context).locale ==
                        Locale('en', 'US')
                        ? MediaQuery.of(context).size.width / 4.5
                        : MediaQuery.of(context).size.width / 3.9,
                  ),
                  Text(
                    'center classes'.tr().toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CenterClasses(
              image: 'assets/images/image2.png',
              title:  'سوبرهيروز Superheroes',
              details: 'صف رابع ابتدائي الى سادس ابتدائي',
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => DaycareScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            CenterClasses(
              image: 'assets/images/image2.png',
              title:  'سوبر انفينتس Super infants',
              details: '٤ أسابيع الى ١٢ شهراً',
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => DaycareScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            CenterClasses(
              image: 'assets/images/image2.png',
              title:  'سوبر ستارز Superstars',
              details: 'صف أول ابتدائي الى ثالث ابتدائي',
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => DaycareScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            CenterClasses(
              image: 'assets/images/image2.png',
              title:  'سوبر كي جي Super KG',
              details: 'أربعة سنوات الى خمسة سنوات',
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (_) => DaycareScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CenterClasses extends StatelessWidget {
  const CenterClasses({
    Key key, this.image, this.title, this.details, this.onTap,
  }) : super(key: key);

  final String image,title,details;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF000000).withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 1,
                    width:
                    MediaQuery.of(context).size.width * 0.35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    details,
                    style: TextStyle(
                        color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
