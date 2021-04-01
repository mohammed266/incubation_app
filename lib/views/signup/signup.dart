import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:incubation_app/views/alerts/alerts_controller.dart';
import 'package:incubation_app/views/home/home.dart';
import 'signup_controller.dart';
import '../../shared/components/components.dart';
import '../login/login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name;
  String phone;
  String email;
  String password;
  bool _obscuredText = true;
  bool _signUpLoading = false;
  var myToken;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _toggle() {
    setState(() {
      _obscuredText = !_obscuredText;
    });
  }
  @override
  void initState() {
    _firebaseMessaging.getToken().then((String token){
      assert(token != null);
      setState(() {
        myToken = token;
      });
      print(myToken);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    padding: EdgeInsets.all(30),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/icons/logo1.png',
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'new registration'.tr().toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF273370)),
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'name'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF273370)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                onChanged: (value) {},
                                onSave: (value) {
                                    name = value;
                                },
                                validate: (value) {
                                  if (value.toString().isEmpty) {
                                    return "enter the name".tr().toString();
                                  } else {
                                    return null;
                                  }
                                },
                                secure: false,
                                textInputType: TextInputType.name,
                                icon: true,
                                hint: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'phone number'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF273370)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                onChanged: (v) {},
                                onSave: (value) {
                                    phone = value;
                                },
                                secure: false,
                                validate: (value) {
                                  if (value.toString().isEmpty) {
                                    return "enter phone number1"
                                        .tr()
                                        .toString();
                                  } else {
                                    return null;
                                  }
                                },
                                textInputType: TextInputType.number,
                                icon: true,
                                hint: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'e-mail'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF273370)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                onChanged: (v) {},
                                onSave: (value) {
                                 email = value;
                                },
                                secure: false,
                                validate: (value) {
                                  if (value.toString().isEmpty) {
                                    return "enter e-mail".tr().toString();
                                  } else {
                                    return null;
                                  }
                                },
                                textInputType: TextInputType.emailAddress,
                                icon: true,
                                hint: '',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'password'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF273370)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                onChanged: (v) {},
                                onSave: (value) {
                                    password=value;
                                },
                                secure: _obscuredText,
                                validate: (value) {
                                  if (value.toString().isEmpty) {
                                    return "enter password".tr().toString();
                                  } else if (value.toString().length < 8) {
                                    return 'weak password1'.tr().toString();
                                  }
                                  return null;
                                },
                                textInputType: TextInputType.visiblePassword,
                                icon: true,
                                prefix: InkWell(
                                  onTap: _toggle,
                                  child: Icon(
                                    Icons.visibility_outlined,
                                    color: _obscuredText
                                        ? Colors.black12
                                        : Colors.black54,
                                    size: 17,
                                  ),
                                ),
                                hint: '',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        _signUpLoading
                            ? Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF273370)),
                            ))
                            : defaultButton(
                                function: () async{
                                  if (!_formKey.currentState.validate()) {
                                    print('unValidated');
                                    return;
                                  } else {
                                    print(' validated');
                                    _formKey.currentState.save();
                                    setState(() {
                                      _signUpLoading = true;
                                    });
                                    await SignUpController.signUp(
                                        thirdName: name,
                                        email: email,
                                        pass: password,
                                        phone: phone,
                                        context: context,
                                    );
                                    setState(() {
                                      _signUpLoading = false;
                                    });
                                    // try{
                                    //
                                    //   await AlertsController.alerts(
                                    //     pass: password,
                                    //     userName: phone,
                                    //     token: myToken,
                                    //     context: context,
                                    //   );
                                    //   // Navigator.push(
                                    //   //   context,
                                    //   //   MaterialPageRoute(
                                    //   //     builder: (_) => HomeScreen(),
                                    //   //   ),
                                    //   // );
                                    // } on PlatformException catch(e){
                                    //   setState(() {
                                    //     _signUpLoading = false;
                                    //   });
                                    //   print(e.message);
                                    //   Fluttertoast.showToast(
                                    //     msg: e.message,
                                    //     toastLength: Toast.LENGTH_SHORT,
                                    //     gravity: ToastGravity.CENTER,
                                    //     timeInSecForIosWeb: 1,
                                    //     backgroundColor: Colors.black12,
                                    //     textColor: Color(0xFF273370),
                                    //     fontSize: 14.0,
                                    //   );
                                    //   // setState(() {
                                    //   //   _signUpLoading = false;
                                    //   // });
                                    // }
                                   }
                                },
                                color: Color(0xFFA6C437),
                                text: 'sign up'.tr().toString(),
                              ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => LoginScreen(),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'have an account?'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF273370),
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'log in'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFA6C437),
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
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
}
