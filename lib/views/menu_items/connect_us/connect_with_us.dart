import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'connect_us_controller.dart';
import '../../../shared/components/components.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConnectUsScreen extends StatefulWidget {
  @override
  _ConnectUsScreenState createState() => _ConnectUsScreenState();
}

class _ConnectUsScreenState extends State<ConnectUsScreen> {
  ConnectUsController controller = ConnectUsController();
  @override
  void initState() {
    controller.getConnectUs().then((value) {
      setState(() {
        controller.loading = false;
      });
    });
    super.initState();
  }

  List<String> ddl = ["ججز زيارة", "استفسار عن أسعار", "أخرى"];
  String _newValue;
  String _name;
  String _email;
  String _message;
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
                height: 70,
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
                // padding: EdgeInsets.only(bottom: 15, left: 30, right: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    controller.loading
                        ? Center(child: Text('..loading'))
                        : GoogleMap(
                            markers: {
                              Marker(
                                markerId: MarkerId('id-1'),
                                position: LatLng(24.7241502, 47.3830568),
                                icon: BitmapDescriptor.defaultMarker,
                              ),
                            },
                            mapType: MapType.normal,
                            myLocationEnabled: true,
                            zoomControlsEnabled: false,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(double.parse(controller.latLog[0]),
                                  double.parse(controller.latLog[1])),
                              zoom: 8.0,
                            ),
                          ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 30, right: 30),
                        child: defaultButton(
                          text: 'directions'.tr().toString(),
                          color: Color(0xFFA6C437),
                          function: () {
                            // HtmlWidget(
                            //   controller.connectUsModel.googleMapIframe,
                            //   webView: true,
                            // );
                            controller.openMap(
                              double.parse(controller.latLog[0]),
                              double.parse(controller.latLog[1]),
                            );
                          },
                        ),
                      ),
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
                    Form(
                      key: controller.connectKey,
                      child: Column(
                        children: [
                          inputField(
                            onSave: (v) {
                              _name = v;
                            },
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
                            onSave: (v) {
                              _email = v;
                            },
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
                              items: ddl.map((String value) {
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
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xFFBEBEBE)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: 'الرسالة',
                                hintStyle: TextStyle(
                                    fontSize: 12, color: Color(0xFFBEBEBE)),
                              ),
                              maxLines: 4,
                              onSaved: (v) {
                                setState(() {
                                  _message = v;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    //
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
                              if (controller.connectKey.currentState
                                  .validate()) {
                                controller.connectKey.currentState.save();
                                controller.sentContact(
                                  email: _email,
                                  ddl: _newValue,
                                  message: _message,
                                  name: _name,
                                );
                                Fluttertoast.showToast(
                                    msg: "تم ارسال رسالتك بنجاح ",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                print(_message);
                                print(_email);
                                print(_name);
                                print(_newValue);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              controller.launchURL(
                                  'tel:${controller.connectUsModel.contactPhone}');
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
                      // height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFFCFCFC),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: controller.loading
                          ? Center(child: Text("Loading"))
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.connectUsModel.contactInfo.length,
                              itemBuilder: (_, i) => Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: ConnectDetails(
                                  text:
                                      '${controller.connectUsModel.contactInfo[i].value}',
                                  title:
                                      '${controller.connectUsModel.contactInfo[i].name}',
                                  image:
                                      '${controller.connectUsModel.contactInfo[i].icon.toString()}',
                                ),
                              ),
                            ),
                      //     //   image: 'assets/icons/icon19.png',
                      //     image: 'assets/icons/icon20.png',
                      //     //   image: 'assets/icons/icon21.png',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image.asset(
                    //       'assets/icons/icon1.png',
                    //     ),
                    //     Image.asset(
                    //       'assets/icons/icon2.png',
                    //       height: 35,
                    //       width: 35,
                    //     ),
                    //     SizedBox(
                    //       width: 20,
                    //     ),
                    //     Image.asset(
                    //       'assets/icons/icon3.png',
                    //       height: 35,
                    //       width: 35,
                    //     ),
                    //   ],
                    // ),
                    controller.loading
                        ? Center(child: Text("Loading"))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: controller.connectUsModel.social
                                .map((e) => InkWell(
                                      onTap: () {
                                        controller.launchURL(e.iconLink);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: NetworkImage(e.icon),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
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
          child: Image.network(image),
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
