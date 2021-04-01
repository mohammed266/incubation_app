import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:incubation_app/views/forget_password/forget_pass_controller.dart';
import 'package:incubation_app/views/login/login.dart';
import '../../shared/components/components.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final ForgetPassController forgetPassController;

  const ForgetPasswordScreen({Key key, this.forgetPassController})
      : super(key: key);
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _email;
  bool _forgetPassLoading = false;
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
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/image10.png',
                                height: MediaQuery.of(context).size.width * 0.4,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'اكتب بريدك الالكتروني المسجل بالموقع',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  _email = value;
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
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              // Text(
                              //   'الرقم السرى الجديد',
                              //   style:
                              //   TextStyle(fontSize: 15, color: Color(0xFF273370)),
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // inputField(
                              //   onChanged: (v) {},
                              //   onSave: (value){
                              //     // setState(() {
                              //     //   value = _password;
                              //     // });
                              //   },
                              //   secure: true,
                              //   validate: (value){
                              //     if(value.toString().isEmpty){
                              //       return"enter password".tr().toString();
                              //     }else if (value.toString().length < 8) {
                              //       return 'weak password1'.tr().toString();
                              //     }
                              //     return null;
                              //   },
                              //   textInputType: TextInputType.visiblePassword,
                              //   icon: true,
                              //   prefix: InkWell(
                              //     onTap: (){},
                              //     child: Icon(
                              //       Icons.visibility_outlined,
                              //       color: Colors.black12,
                              //       // _obscuredText ? Colors.black12 : Colors.black54,
                              //       size: 17,
                              //     ),
                              //   ),
                              //   hint: '',
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        _forgetPassLoading
                            ? Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF273370)),
                            ))
                            : defaultButton(
                          function: () async{
                            if (!formKey.currentState.validate()){
                              print('unValidated');
                              return;
                            } else {
                              setState(() {
                                _forgetPassLoading = true;
                              });
                              print(' validated');
                              formKey.currentState.save();
                             await ForgetPassController.forgetPass(email: _email);
                              Fluttertoast.showToast(
                                msg: 'تم تغيير كلمه المرور وارسالها عبر الايميل',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.black,
                                textColor: Color(0xFF273370),
                                fontSize: 14.0,
                              );
                              setState(() {
                                _forgetPassLoading = false;
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) => PinCodeVerificationScreen("+8801376221100"),
                              //   ),
                              // );
                              // print(_email);
                            }
                          },
                          color: Color(0xFFA6C437),
                          text: 'ارسال ',
                        ),
                        SizedBox(
                          height: 20,
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
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'log in'.tr().toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF273370),
                                  fontWeight: FontWeight.w700),
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
