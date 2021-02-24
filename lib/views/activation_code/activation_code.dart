import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:incubation_app/views/home/home.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:easy_localization/easy_localization.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  PinCodeVerificationScreen(this.phoneNumber);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/image1.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: Offset(0, 0),
                          blurRadius: 50,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/icons/icon4.png',
                            fit: BoxFit.fill,
                            height: 150,
                            width: 150,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'verification code'.tr().toString(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF273370),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          'sent verification'.tr().toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF6A6A6A),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Form(
                          key: formKey,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: PinCodeTextField(
                                appContext: context,
                                pastedTextStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.3),
                                  fontWeight: FontWeight.bold,
                                ),
                                length: 4,
                                obscureText: true,
                                // obscuringCharacter: '*',
                                blinkWhenObscuring: true,
                                animationType: AnimationType.none,
                                validator: (v) {
                                  if (v.length < 3) {
                                    return "";
                                  } else {
                                    return null;
                                  }
                                },
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.underline,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  // activeFillColor: hasError ? Colors.orange : Colors.white,
                                ),
                                cursorColor: Colors.black,
                                animationDuration: Duration(milliseconds: 300),
                                backgroundColor: Colors.white,
                                enableActiveFill: false,
                                errorAnimationController: errorController,
                                controller: textEditingController,
                                keyboardType: TextInputType.number,
                                onCompleted: (v) {
                                  print("Completed");
                                },
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                                beforeTextPaste: (text) {
                                  print("Allowing to paste $text");
                                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                  return true;
                                },
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            hasError ? "fill cells".tr().toString() : "",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.replay,
                                color: Color(0xFF6A6A6A),
                                size: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'resend'.tr().toString(),
                                style: TextStyle(
                                    color: Color(0xFF6A6A6A), fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        buildTimer(),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 30),
                          child: ButtonTheme(
                            height: 50,
                            child: FlatButton(
                              onPressed: () {
                                formKey.currentState.validate();
                                // conditions for validating
                                if (currentText.length != 4) {
                                  errorController.add(ErrorAnimationType
                                      .shake); // Triggering error shake animation
                                  setState(() {
                                    hasError = true;
                                  });
                                } else {
                                  setState(() {
                                    hasError = false;
                                    scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                           content: Text("Aye!!"),
                                      duration: Duration(seconds: 2),
                                    ));
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => HomeScreen(),
                                    ),
                                  );
                                }
                              },
                              child: Center(
                                  child: Text(
                                'confirm'.tr().toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFA6C437),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //     Flexible(
                        //         child: FlatButton(
                        //           child: Text("Clear"),
                        //           onPressed: () {
                        //             textEditingController.clear();
                        //           },
                        //         )),
                        //     Flexible(
                        //         child: FlatButton(
                        //           child: Text("Set Text"),
                        //           onPressed: () {
                        //             textEditingController.text = "1234";
                        //           },
                        //         )),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween(begin: 15.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: Color(0xFFC53543)),
          ),
        ),
      ],
    );
  }
}
