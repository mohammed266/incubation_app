import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/shared/shared_helper.dart';
import 'package:incubation_app/views/alt/view.dart';
import 'guardian_controller.dart';
import '../../child_profile/child_profile.dart';
import '../../add_child/add_child.dart';
import '../../../shared/components/components.dart';
import '../../alerts/alerts.dart';
import '../../edit_guardian_profile/edit_guardian_profile.dart';
import '../../search/search.dart';

class GuardianScreen extends StatefulWidget {
  @override
  _GuardianScreenState createState() => _GuardianScreenState();
}

class _GuardianScreenState extends State<GuardianScreen> {
  GuardianController controller = GuardianController();

  @override
  void initState() {
    controller.getGuardian().then((value) {
      setState(() {
        controller.loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: !SharedHelper.isLogged ? AltView() : SingleChildScrollView(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AlertsScreen(),
                              ),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SearchScreen(),
                              ),
                            );
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
                            InkWell(
                              onTap: () async {
                                // await controller.getImage();
                              },
                              child: Container(
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
                                  backgroundImage:
                                      AssetImage('assets/images/image4.png'),
                                ),
                              ),
                            ),
                            Text(
                              'اسم الام او الاب',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                            Text(
                              '010254652155',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Spacer(),
                            defaultButton(
                              text: 'edit profile'.tr().toString(),
                              function: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditGuardianProfileScreen(),
                                  ),
                                );
                              },
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
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  width: double.infinity,
                  // height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      // ListView(
                      //   shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   children: [
                      //     Container(
                      //       padding: EdgeInsets.only(
                      //           right: 5, left: 20, top: 5, bottom: 5),
                      //       height: 60,
                      //       decoration: BoxDecoration(
                      //         color: Color(0xFF273370),
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       child: Row(
                      //         children: [
                      //           Image.asset(
                      //             'assets/images/image8.png',
                      //             height: 50,
                      //             width: 50,
                      //           ),
                      //           Spacer(
                      //             flex: 1,
                      //           ),
                      //           Text(
                      //             'اسم الطفل',
                      //             style: TextStyle(
                      //                 fontSize: 13, color: Colors.white),
                      //           ),
                      //           Spacer(
                      //             flex: 1,
                      //           ),
                      //           Text(
                      //             'مفعل',
                      //             style: TextStyle(
                      //                 color: Color(0xFFA6C437), fontSize: 10),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      controller.loading ? Center(child: Text("loading")) : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.listOfChild.length,
                        itemBuilder: (_, i) => Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChildProfileScreen(id: controller.listOfChild[i].id,),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  right: 5, left: 20, top: 5, bottom: 5),
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFF273370),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Image.network(
                                    '${controller.listOfChild[i].img}',
                                    height: 50,
                                    width: 50,
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Text(
                                    '${controller.listOfChild[i].name}',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Text(controller.listOfChild[i].status == 0 ? controller.listOfChild[i].status.toString() : controller.listOfChild[i].status['value'] ,
                                    style: TextStyle(
                                        color: Color(0xFFA6C437), fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        child: defaultButton(
                          text: 'add child'.tr().toString(),
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddChildScreen(),
                              ),
                            );
                          },
                          color: Color(0xFFA6C437),
                          r: 10,
                        ),
                      ),
                    ],
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
