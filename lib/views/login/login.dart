import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'login_controller.dart';
import '../../shared/components/components.dart';
import '../forget_password/forget_password,dart.dart';
import '../home/home.dart';
import '../signup/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _phone;
  String _password;
  bool checkedValue = true;
  bool _obscuredText = true;
  bool _logInLoading = false;
  var myToken;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _toggle() {
    setState(() {
      _obscuredText = !_obscuredText;
    });
  }

  savePref({String phone, String pass}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("phone", phone);
    preferences.setString("password", pass);
    print(preferences.getString("phone"));
    print(preferences.getString("password"));
  }


  @override
  void initState() {
    savePref();
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
                            'title'.tr().toString(),
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
                                'phone number'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF273370)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                onChanged: (value) {
                                  // setState(() {
                                  //   _phone = value;
                                  // });
                                },
                                onSave: (value) {
                                  setState(() {
                                    _phone = value;
                                  });
                                },
                                secure: false,
                                validate: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'enter phone number'.tr().toString();
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
                                'password'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF273370)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              inputField(
                                onChanged: (value) {
                                  if (value.toString().isNotEmpty) {
                                    return '';
                                  } else if (value.toString().length >= 8) {
                                    return 'ok';
                                  }
                                  _password = value;
                                },
                                onSave: (value) {
                                  setState(() {
                                    _password = value;
                                  });
                                },
                                validate: (value) {
                                  if (value.toString().isEmpty) {
                                    return 'enter the password'.tr().toString();
                                  } else if (value.toString().length < 8) {
                                    return 'weak password'.tr().toString();
                                  }
                                  return null;
                                },
                                secure: _obscuredText,
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
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        checkedValue = !checkedValue;
                                      });
                                    },
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: checkedValue
                                            ? Colors.white
                                            : Color(0xFF273370),
                                        border: Border.all(
                                          color: Color(0xFFBEBEBE),
                                        ),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "save login data".tr().toString(),
                                    style: TextStyle(
                                        fontSize: 10, color: Color(0xFFBEBEBE)),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              ForgetPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'forget pass'.tr().toString(),
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF273370),
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        _logInLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                backgroundColor: Color(0xFF273370),
                              ))
                            : defaultButton(
                                function: () async {
                                  if (!_formKey.currentState.validate()) {
                                    print('unValidated');
                                    return;
                                  } else {
                                    setState(() {
                                      _logInLoading = true;
                                    });
                                    _formKey.currentState.save();
                                    await LoginController.login(
                                        _phone, _password, context);
                                    setState(() {
                                      _logInLoading = false;
                                    });
                                    savePref(pass: _password, phone: _phone);
                                  }
                                },
                                color: Color(0xFFA6C437),
                                text: 'login'.tr().toString(),
                              ),
                        SizedBox(
                          height: 35,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text('or'.tr().toString())),
                        SizedBox(
                          height: 15,
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
                              width: 10,
                            ),
                            Image.asset(
                              'assets/icons/icon2.png',
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/icons/icon3.png',
                              height: 35,
                              width: 35,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'don\'t have an account?'.tr().toString(),
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF273370),
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'new account'.tr().toString(),
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFA6C437),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomeScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'skip'.tr().toString(),
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xFFF7941D)),
                            ),
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
