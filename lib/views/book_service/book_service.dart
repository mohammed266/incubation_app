import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/views/book_service/models/services.dart';
import 'book_sevice_controller.dart';
import '../../shared/components/components.dart';
import '../add_child/add_child.dart';
import 'models/children.dart';

class BookServiceScreen extends StatefulWidget {
  @override
  _BookServiceScreenState createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  BookServiceController _controller = BookServiceController();
  List<ChildrenModel> _childrenModel;
  List<ServicesModel> _servicesModel;

  ChildrenModel child;
  ServicesModel service;

  bool _pageIsLoading = true;
  bool _buttonIsLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData()async{
    _childrenModel = await _controller.getChildren();
    _servicesModel = await _controller.getServices();
    setState(() {
      _pageIsLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _pageIsLoading ? Center(child:  CircularProgressIndicator(
          valueColor:
          AlwaysStoppedAnimation<Color>(Color(0xFF273370)),
        )) :
        Column(
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
                        ? MediaQuery.of(context).size.width / 4.5
                        : MediaQuery.of(context).size.width / 3.5,
                  ),
                  Text(
                    'book Service'.tr().toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title(
                    text: 'choose service'.tr().toString(),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFECEFFF),
                      ),
                    ),
                    child: DropdownButton(
                      underline: Text(''),
                      items: _servicesModel.map((ServicesModel value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value.title),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          service = newValue;
                        });
                      },
                      value: service,
                      isExpanded: true,
                      elevation: 0,
                      hint: Text(
                        'اسم الخدمة',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFAAAAAA)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _title(
                    text: 'subscription date'.tr().toString(),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    padding: EdgeInsets.only(left: 15, right: 15,bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFECEFFF),
                      ),
                    ),
                    child: DateTimePicker(
                      initialValue: '',
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      // dateLabelText: '20/12/2020',
                      onChanged: (val) => print(val),
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) => print(val),
                      icon: Icon(Icons.event),
                      type: DateTimePickerType.date,
                      style: TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        hintText: '20/12/2020',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFBFBFBF),
                        ),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _title(
                    text: 'chose child'.tr().toString(),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    padding: EdgeInsets.only(left: 15, right: 15,bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFECEFFF),
                      ),
                    ),
                   /* child: DropdownButton<String>(
                      underline: Text(''),
                      items: childList.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _newValue1 = newValue;
                        });
                      },
                      value: _newValue1,
                      isExpanded: true,
                      elevation: 0,
                      hint: Text(
                        'اسم الخدمة',
                        style:
                        TextStyle(fontSize: 12, color: Color(0xFFAAAAAA)),
                      ),
                    ), */
                    child: DropdownButton(
                      underline: SizedBox(),
                      value: child,
                      isExpanded: true,
                      hint: Text(
                        'اسم الطفل',
                        style: TextStyle(fontSize: 12,color: Color(0xFF6A6A6A)),
                      ),
                      elevation: 0,
                      onChanged: (value){
                          if(value != 'null'){
                            setState(() {
                              child = value;
                            });
                          }else{
                            Navigator.push(context, MaterialPageRoute(builder: (_)=> AddChildScreen()),);
                          }
                      },
                      items: [
                        ..._childrenModel.map((ChildrenModel e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e,
                        ),).toList(),
                        DropdownMenuItem(
                          value: 'null',
                          child: Row(
                            children: [
                              Icon(Icons.add,size: 14,),
                              SizedBox(
                                width: 5,
                              ),
                              Text('اضافه طفل اخر',style: TextStyle(fontSize: 15, color: Color(0xFF6A6A6A)),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  _buttonIsLoading ? Center(child: CircularProgressIndicator(
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Color(0xFF273370)),
                  ),) : defaultButton(
                    text: 'book service1'.tr().toString(),
                    color: Color(0xFFA6C437),
                    function: ()async{
                      setState(() {
                        _buttonIsLoading = true;
                      });
                     await _controller.sendBookService(childId: child.id,serviceId: service.id);
                      // _showDialog();
                      setState(() {
                        _buttonIsLoading = false;
                      });
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title({String text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: Color(0xFF6A6A6A)),
      ),
    );
  }
}


/*
Future<void> _showDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height/ 7,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'dialog text'.tr().toString(),
                              style: TextStyle(
                                fontSize: EasyLocalization.of(context).locale ==  Locale('en', 'US')
                                 ? 15 : 17,
                                color: Color(0xFF707070),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              print('ooo');
                            },
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(44),
                                  bottomLeft: Radius.circular(44),
                                ),
                                color: Color(0xFFA6C437),
                              ),
                              child: Center(
                                  child: Text(
                                    'dialog button'.tr().toString(),
                                    style:
                                    TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7941D),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.check,color: Colors.white,size: 60,),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
 */