import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AlertsScreen extends StatefulWidget {

  @override
  _AlertsScreenState createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {


  Future<void> _showDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .25),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(44),
                ),
                insetPadding: EdgeInsets.only(
                  right: 25,
                  left: 25,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(44),
                          topLeft: Radius.circular(44),
                        ),
                        color: Color(0xFFFCFCFC),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'عنوان التنبية',
                            style:
                            TextStyle(fontSize: 15, color: Color(0xFF273370),fontWeight: FontWeight.w500),
                          ),
                          Text('‏05:15 م',
                            style:
                            TextStyle(fontSize: 11, color: Color(0xFF6A6A6A)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/ 19,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال .نصاً بديلاً ومؤقتاً',
                        style: TextStyle(
                          fontSize: EasyLocalization.of(context).locale ==  Locale('en', 'US')
                              ? 15 : 15,
                          color: Color(0xFF6A6A6A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(),
                    Text('15/02/2021',
                      style: TextStyle(fontSize: 14,color: Color(0xFF273370)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
                  color: Color(0xFF273370),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
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
                          ? MediaQuery.of(context).size.width / 3.3
                          : MediaQuery.of(context).size.width / 3.5,
                    ),
                    Text(
                      'alerts'.tr().toString(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_,i) => Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: InkWell(
                        onTap: (){
                          _showDialog();
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/icons/icon17.png',
                                height: 50,
                                width: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'عنوان التنبية',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF273370),
                                              fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '15/02/2021',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF273370),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.أنه مازال نصاً بديلاً ومؤقتاً.أنه مازال نصاً بديلاً ومؤقتاً.أنه مازال نصاً بديلاً ومؤقتاً.',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFFAAAAAA),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
