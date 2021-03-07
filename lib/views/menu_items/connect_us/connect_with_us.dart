import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../shared/components/components.dart';

class ConnectUsScreen extends StatefulWidget {
  @override
  _ConnectUsScreenState createState() => _ConnectUsScreenState();
}

class _ConnectUsScreenState extends State<ConnectUsScreen> {
  List<String> date = ['لا', 'نعم'];

  String _newValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListView(
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
                      'connect us'.tr().toString(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15, left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/map.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    defaultButton(
                      text: 'directions'.tr().toString(),
                      color: Color(0xFFA6C437),
                      function: () {
                        //
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 35),
                child: Column(
                  children: [
                    defaultButton(
                      text: 'leave message'.tr().toString(),
                      color: Color(0xFFFCFCFC),
                      function: null,
                      c: Color(0xFF6A6A6A),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    inputField(
                      onSave: (v) {},
                      onChanged: (v) {},
                      validate: (v) {},
                      icon: true,
                      secure: false,
                      hint: 'الاسم',
                      textInputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    inputField(
                      onSave: (v) {},
                      onChanged: (v) {},
                      validate: (v) {},
                      icon: true,
                      secure: false,
                      hint: 'البريد الالكترونى',
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xFFE5E5E5),
                        ),
                      ),
                      child: DropdownButton<String>(
                        underline: Text(''),
                        items: date.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _newValue = newValue;
                          });
                        },
                        value: _newValue,
                        isExpanded: true,
                        hint: Text(
                          'حجز زيارة',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFFBEBEBE)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFFE5E5E5),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: 'الرسالة',
                          hintStyle:
                              TextStyle(fontSize: 12, color: Color(0xFFBEBEBE)),
                        ),
                        maxLines: 4,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: defaultButton(
                            color: Color(0xFFA6C437),
                            text: 'ارسال',
                            function: () {
                              //
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              //
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xFFAAAAAA),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'اتصل بنا',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFAAAAAA),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFFCFCFC),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          ConnectDetails(
                            image: 'assets/icons/icon19.png',
                            title: 'العنوان',
                            text: 'شارع معاوية بن عبد الله',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ConnectDetails(
                            image: 'assets/icons/icon20.png',
                            title: 'رقم الجوال',
                            text: '+9660533322302',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ConnectDetails(
                            image: 'assets/icons/icon21.png',
                            title: 'البريد الالكترونى',
                            text: 'info@superheroesland.com',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/icon1.png',
                          height: 35,
                          width: 35,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'assets/icons/icon2.png',
                          height: 35,
                          width: 35,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'assets/icons/icon3.png',
                          height: 35,
                          width: 35,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConnectDetails extends StatelessWidget {
  const ConnectDetails({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  final String image, title, text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(image),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFF7941D),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFFAAAAAA),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
