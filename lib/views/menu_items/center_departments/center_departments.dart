import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/shared/components/components.dart';
import 'center_department_controller.dart';

class CenterDepartmentsScreen extends StatefulWidget {
  @override
  _CenterDepartmentsScreenState createState() =>
      _CenterDepartmentsScreenState();
}

class _CenterDepartmentsScreenState extends State<CenterDepartmentsScreen> {
  CenterDepartmentController controller = CenterDepartmentController();

  @override
  void initState() {
    controller.getCenterDepartment().then((value) {
      setState(() {
        controller.loading = false;
      });
    });
    createVariables();
    super.initState();
  }
  // List<bool> audioSelectedList = [];
  createVariables() {
    _selectedItems = List.generate(controller.listOfCenterDep.length, (i) => false);
  }
  // bool _isActive = false;
  List<bool> _selectedItems = List<bool>();

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
                          ? MediaQuery.of(context).size.width / 5.2
                          : MediaQuery.of(context).size.width / 3.9,
                    ),
                    Text(
                      'center departments'.tr().toString(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //
              /*GestureDetector(
                onTap: () {
                  setState(() {
                    if(_isActive == 2){
                      _isActive = 1;
                    }else {
                      _isActive = 2;
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isActive ==2 ? Color(0xFFF7941D) : Color(0xFFFCFCFC),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'day care department'.tr().toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color:
                            _isActive ==2 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          _isActive == 2
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: _isActive == 2 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (_isActive == 2)
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Container(
                    // height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/image5.png',
                          fit: BoxFit.fill,
                          height: 150,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('نؤمن بأن طفلكم مميز ولديه قوة خارقة بداخله لذلك أنشأنا سوبرهيروز لاند وهو مركز مرخص من سوبرمان متخصص في تقديم خدمات رعاية الأطفال الخارقين في مدينة جدة. يوفر سوبرهيروز لاند خدمات الرعاية النهارية والمسائية للأبطال الصغار من عمر ٦ أسابيع الى ٥ سنوات وكذلك لدينا قسم مخصص لرعاية الأبطال الخارقين في المرحلة الابتدائية بعد دوام المدرسة وفي الإجازات الصيفية. يتميز سوبرهيروز لاند ببرامجه الترفيهية والتعليمية المتكاملة في بيئة امنة صديقة تهدف الى تطوير المهارات الحياتية الأساسية لطفلك مثل التحكم في قوته الخارقة والتعاون والمشاركة مع الابطال الاخرين في المركز الى جانب العديد من الأنشطة الخاصة والرحلات التي تعزز نمو طفلك وتشجعه على التعرف على العالم المحيط به.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              //
              GestureDetector(
                onTap: () {
                  controller.jumpTo(170);
                  setState(() {
                    if(_isActive == 3){
                      _isActive = 1;
                    }else {
                      _isActive = 3;
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isActive == 3 ? Color(0xFFF7941D) : Color(0xFFFCFCFC),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'school care department'.tr().toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color:
                            _isActive == 3 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          _isActive ==3
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: _isActive == 3 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (_isActive == 3)
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Container(
                    // height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/image5.png',
                          fit: BoxFit.fill,
                          height: 150,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('نؤمن بأن طفلكم مميز ولديه قوة خارقة بداخله لذلك أنشأنا سوبرهيروز لاند وهو مركز مرخص من سوبرمان متخصص في تقديم خدمات رعاية الأطفال الخارقين في مدينة جدة. يوفر سوبرهيروز لاند خدمات الرعاية النهارية والمسائية للأبطال الصغار من عمر ٦ أسابيع الى ٥ سنوات وكذلك لدينا قسم مخصص لرعاية الأبطال الخارقين في المرحلة الابتدائية بعد دوام المدرسة وفي الإجازات الصيفية. يتميز سوبرهيروز لاند ببرامجه الترفيهية والتعليمية المتكاملة في بيئة امنة صديقة تهدف الى تطوير المهارات الحياتية الأساسية لطفلك مثل التحكم في قوته الخارقة والتعاون والمشاركة مع الابطال الاخرين في المركز الى جانب العديد من الأنشطة الخاصة والرحلات التي تعزز نمو طفلك وتشجعه على التعرف على العالم المحيط به.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              //
              GestureDetector(
                onTap: () {
                  controller.jumpTo(250);
                  setState(() {
                    if(_isActive == 4){
                      _isActive = 1;
                    }else {
                      _isActive = 4;
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isActive == 4 ? Color(0xFFF7941D) : Color(0xFFFCFCFC),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'library of Knowledge'.tr().toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color:
                            _isActive == 4 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          _isActive == 4
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: _isActive == 4 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (_isActive == 4)
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Container(
                    // height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/image5.png',
                          fit: BoxFit.fill,
                          height: 150,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('نؤمن بأن طفلكم مميز ولديه قوة خارقة بداخله لذلك أنشأنا سوبرهيروز لاند وهو مركز مرخص من سوبرمان متخصص في تقديم خدمات رعاية الأطفال الخارقين في مدينة جدة. يوفر سوبرهيروز لاند خدمات الرعاية النهارية والمسائية للأبطال الصغار من عمر ٦ أسابيع الى ٥ سنوات وكذلك لدينا قسم مخصص لرعاية الأبطال الخارقين في المرحلة الابتدائية بعد دوام المدرسة وفي الإجازات الصيفية. يتميز سوبرهيروز لاند ببرامجه الترفيهية والتعليمية المتكاملة في بيئة امنة صديقة تهدف الى تطوير المهارات الحياتية الأساسية لطفلك مثل التحكم في قوته الخارقة والتعاون والمشاركة مع الابطال الاخرين في المركز الى جانب العديد من الأنشطة الخاصة والرحلات التي تعزز نمو طفلك وتشجعه على التعرف على العالم المحيط به.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              //
              GestureDetector(
                onTap: () {
                  controller.jumpTo(300);
                  setState(() {
                    if(_isActive == 5){
                      _isActive = 1;
                    }else {
                      _isActive = 5;
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isActive == 5 ? Color(0xFFF7941D) : Color(0xFFFCFCFC),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'arts and Creative Activities'.tr().toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color:
                            _isActive == 5 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          _isActive == 5
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: _isActive == 5 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (_isActive == 5)
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Container(
                    // height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/image5.png',
                          fit: BoxFit.fill,
                          height: 150,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('نؤمن بأن طفلكم مميز ولديه قوة خارقة بداخله لذلك أنشأنا سوبرهيروز لاند وهو مركز مرخص من سوبرمان متخصص في تقديم خدمات رعاية الأطفال الخارقين في مدينة جدة. يوفر سوبرهيروز لاند خدمات الرعاية النهارية والمسائية للأبطال الصغار من عمر ٦ أسابيع الى ٥ سنوات وكذلك لدينا قسم مخصص لرعاية الأبطال الخارقين في المرحلة الابتدائية بعد دوام المدرسة وفي الإجازات الصيفية. يتميز سوبرهيروز لاند ببرامجه الترفيهية والتعليمية المتكاملة في بيئة امنة صديقة تهدف الى تطوير المهارات الحياتية الأساسية لطفلك مثل التحكم في قوته الخارقة والتعاون والمشاركة مع الابطال الاخرين في المركز الى جانب العديد من الأنشطة الخاصة والرحلات التي تعزز نمو طفلك وتشجعه على التعرف على العالم المحيط به.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              //
              GestureDetector(
                onTap: () {
                  controller.jumpTo(380);
                  setState(() {
                    if(_isActive == 6){
                      _isActive = 1;
                    }else {
                      _isActive = 6;
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isActive == 6 ? Color(0xFFF7941D) : Color(0xFFFCFCFC),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'entertainment and fun section'.tr().toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color:
                            _isActive == 6 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          _isActive == 6
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: _isActive == 6 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (_isActive == 6)
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Container(
                    // height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/image5.png',
                          fit: BoxFit.fill,
                          height: 150,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('نؤمن بأن طفلكم مميز ولديه قوة خارقة بداخله لذلك أنشأنا سوبرهيروز لاند وهو مركز مرخص من سوبرمان متخصص في تقديم خدمات رعاية الأطفال الخارقين في مدينة جدة. يوفر سوبرهيروز لاند خدمات الرعاية النهارية والمسائية للأبطال الصغار من عمر ٦ أسابيع الى ٥ سنوات وكذلك لدينا قسم مخصص لرعاية الأبطال الخارقين في المرحلة الابتدائية بعد دوام المدرسة وفي الإجازات الصيفية. يتميز سوبرهيروز لاند ببرامجه الترفيهية والتعليمية المتكاملة في بيئة امنة صديقة تهدف الى تطوير المهارات الحياتية الأساسية لطفلك مثل التحكم في قوته الخارقة والتعاون والمشاركة مع الابطال الاخرين في المركز الى جانب العديد من الأنشطة الخاصة والرحلات التي تعزز نمو طفلك وتشجعه على التعرف على العالم المحيط به.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              //
              GestureDetector(
                onTap: () {
                  controller.jumpTo(450);
                  setState(() {
                    if(_isActive == 7){
                      _isActive = 1;
                    }else {
                      _isActive = 7;
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isActive == 7 ? Color(0xFFF7941D) : Color(0xFFFCFCFC),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'healthy food kitchen'.tr().toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color:
                            _isActive == 7 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          _isActive == 7
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: _isActive == 7 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (_isActive == 7)
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Container(
                    // height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/image5.png',
                          fit: BoxFit.fill,
                          height: 150,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('نؤمن بأن طفلكم مميز ولديه قوة خارقة بداخله لذلك أنشأنا سوبرهيروز لاند وهو مركز مرخص من سوبرمان متخصص في تقديم خدمات رعاية الأطفال الخارقين في مدينة جدة. يوفر سوبرهيروز لاند خدمات الرعاية النهارية والمسائية للأبطال الصغار من عمر ٦ أسابيع الى ٥ سنوات وكذلك لدينا قسم مخصص لرعاية الأبطال الخارقين في المرحلة الابتدائية بعد دوام المدرسة وفي الإجازات الصيفية. يتميز سوبرهيروز لاند ببرامجه الترفيهية والتعليمية المتكاملة في بيئة امنة صديقة تهدف الى تطوير المهارات الحياتية الأساسية لطفلك مثل التحكم في قوته الخارقة والتعاون والمشاركة مع الابطال الاخرين في المركز الى جانب العديد من الأنشطة الخاصة والرحلات التي تعزز نمو طفلك وتشجعه على التعرف على العالم المحيط به.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              //
              GestureDetector(
                onTap: () {
                  controller.jumpTo(500);
                  setState(() {
                    if(_isActive == 8){
                      _isActive = 1;
                    }else {
                      _isActive = 8;
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isActive == 8 ? Color(0xFFF7941D) : Color(0xFFFCFCFC),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'parties and events hall'.tr().toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color:
                            _isActive == 8 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          _isActive == 8
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: _isActive == 8 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (_isActive == 8)
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Container(
                    // height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/image5.png',
                          fit: BoxFit.fill,
                          height: 150,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('نؤمن بأن طفلكم مميز ولديه قوة خارقة بداخله لذلك أنشأنا سوبرهيروز لاند وهو مركز مرخص من سوبرمان متخصص في تقديم خدمات رعاية الأطفال الخارقين في مدينة جدة. يوفر سوبرهيروز لاند خدمات الرعاية النهارية والمسائية للأبطال الصغار من عمر ٦ أسابيع الى ٥ سنوات وكذلك لدينا قسم مخصص لرعاية الأبطال الخارقين في المرحلة الابتدائية بعد دوام المدرسة وفي الإجازات الصيفية. يتميز سوبرهيروز لاند ببرامجه الترفيهية والتعليمية المتكاملة في بيئة امنة صديقة تهدف الى تطوير المهارات الحياتية الأساسية لطفلك مثل التحكم في قوته الخارقة والتعاون والمشاركة مع الابطال الاخرين في المركز الى جانب العديد من الأنشطة الخاصة والرحلات التي تعزز نمو طفلك وتشجعه على التعرف على العالم المحيط به.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              //
              GestureDetector(
                onTap: () {
                  controller.jumpTo(600);
                  setState(() {
                    if(_isActive == 9){
                      _isActive = 1;
                    }else {
                      _isActive = 9;
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFFCFCFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _isActive == 9 ? Color(0xFFF7941D) : Color(0xFFFCFCFC),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'games park'.tr().toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color:
                            _isActive == 9 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          _isActive == 9
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: _isActive == 9 ? Color(0xFFF7941D) : Color(0xFFAAAAAA),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (_isActive == 9)
                Padding(
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child: Container(
                    // height: 50,
                    width: double.infinity,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/image5.png',
                          fit: BoxFit.fill,
                          height: 150,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('نؤمن بأن طفلكم مميز ولديه قوة خارقة بداخله لذلك أنشأنا سوبرهيروز لاند وهو مركز مرخص من سوبرمان متخصص في تقديم خدمات رعاية الأطفال الخارقين في مدينة جدة. يوفر سوبرهيروز لاند خدمات الرعاية النهارية والمسائية للأبطال الصغار من عمر ٦ أسابيع الى ٥ سنوات وكذلك لدينا قسم مخصص لرعاية الأبطال الخارقين في المرحلة الابتدائية بعد دوام المدرسة وفي الإجازات الصيفية. يتميز سوبرهيروز لاند ببرامجه الترفيهية والتعليمية المتكاملة في بيئة امنة صديقة تهدف الى تطوير المهارات الحياتية الأساسية لطفلك مثل التحكم في قوته الخارقة والتعاون والمشاركة مع الابطال الاخرين في المركز الى جانب العديد من الأنشطة الخاصة والرحلات التي تعزز نمو طفلك وتشجعه على التعرف على العالم المحيط به.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ), */
              controller.loading ? Text("loading") : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listOfCenterDep.length,
                itemBuilder: (context, index) => Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(_selectedItems.contains(index)){
                            setState(()  {
                              // audioSelectedList[index] = true;
                              //   _isActive = 1;
                              // } else {
                              //   _isActive = 2;
                              // }

                               createVariables();
                               _selectedItems[index] = true;


                            });
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFFCFCFC),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: _selectedItems.contains(index)
                                    ? Color(0xFFF7941D)
                                    : Color(0xFFFCFCFC),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${controller.listOfCenterDep[index].name}',
                                  // 'day care department'.tr().toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: _selectedItems.contains(index)
                                        ? Color(0xFFF7941D)
                                        : Color(0xFFAAAAAA),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  _selectedItems.contains(index)
                                      ? Icons.keyboard_arrow_up_rounded
                                      : Icons.keyboard_arrow_down_rounded,
                                  color: _selectedItems.contains(index)
                                      ? Color(0xFFF7941D)
                                      : Color(0xFFAAAAAA),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (_selectedItems.contains(index))
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Container(
                            // height: 50,
                            width: double.infinity,
                            // color: Colors.red,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        '${controller.listOfCenterDep[index].img}',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${controller.listOfCenterDep[index].content}',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  // height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    border: Border.all(
                      color: Color(0xFFF0F0F0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 50,
                        offset: Offset(0, 25),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'do not hesitate to book'.tr().toString(),
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFF7941D)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'superHeroes Land'.tr().toString(),
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFAAAAAA)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                        color: Color(0xFFA6C437),
                        text: 'book now'.tr().toString(),
                        function: () {
                          //
                        },
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
