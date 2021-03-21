import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'signup_controller.dart';
import '../../shared/components/components.dart';
import '../login/login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _phone;
  String _email;
  String _password;
  bool _obscuredText = true;
  bool _signUpLoading = false;
  _toggle() {
    setState(() {
      _obscuredText = !_obscuredText;
    });
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
                                  setState(() {
                                    _name = value;
                                  });
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
                                  setState(() {
                                    _phone = value;
                                  });
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
                                  setState(() {
                                    _email = value;
                                  });
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
                                  setState(() {
                                    _password=value;
                                  });
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
                            ? Center(child: CircularProgressIndicator(backgroundColor: Color(0xFF273370),))
                            : defaultButton(
                                function: () {
                                  if (!_formKey.currentState.validate()) {
                                    print('unValidated');
                                    return;
                                  } else {
                                    print(' validated');
                                    _formKey.currentState.save();
                                    setState(() {
                                      _signUpLoading = true;
                                    });
                                    SignUpController.signUp(
                                            thirdName: _name,
                                            email: _email,
                                            pass: _password,
                                            phone: _phone,
                                            context: context)
                                        .then((value) {
                                      setState(() {
                                        _signUpLoading = false;
                                      });
                                    });
                                    // print(_name);
                                    // print(_email);
                                    // print(_password);
                                    // print(_phone);
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
