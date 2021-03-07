import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import 'package:easy_localization/easy_localization.dart';


class ForgetPasswordScreen extends StatelessWidget {
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'phone number'.tr().toString(),
                              style:
                              TextStyle(fontSize: 15, color: Color(0xFF273370)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            inputField(
                              onChanged: (v) {},
                              onSave: (value) {
                                // setState(() {
                                //   value = _phone;
                                // });
                              },
                              secure: false,
                              validate: (value) {
                                if(value.toString().isEmpty){
                                  return"enter phone number1".tr().toString();
                                }else{
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
                              'الرقم السرى الجديد',
                              style:
                              TextStyle(fontSize: 15, color: Color(0xFF273370)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            inputField(
                              onChanged: (v) {},
                              onSave: (value){
                                // setState(() {
                                //   value = _password;
                                // });
                              },
                              secure: true,
                              validate: (value){
                                if(value.toString().isEmpty){
                                  return"enter password".tr().toString();
                                }else if (value.toString().length < 8) {
                                  return 'weak password1'.tr().toString();
                                }
                                return null;
                              },
                              textInputType: TextInputType.visiblePassword,
                              icon: true,
                              prefix: InkWell(
                                onTap: (){},
                                child: Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.black12,
                                  // _obscuredText ? Colors.black12 : Colors.black54,
                                  size: 17,
                                ),
                              ),
                              hint: '',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        defaultButton(
                          function: () {
                            // if (!_formKey.currentState.validate()) {
                            //   print('unValidated');
                            //   return;
                            // } else {
                            //   print(' validated');
                            //   _formKey.currentState.save();
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (_) => PinCodeVerificationScreen("+8801376221100"),
                            //     ),
                            //   );
                              // print(_name);
                              // print(_email);
                              // print(_password);
                              // print(_phone);
                            // }
                          },
                          color: Color(0xFFA6C437),
                          text: 'دخول',
                        ),
                        SizedBox(
                          height: 20,
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
