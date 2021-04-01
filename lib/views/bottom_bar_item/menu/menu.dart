import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incubation_app/shared/shared_helper.dart';
import 'menu_controller.dart';
import '../../../shared/components/components.dart';
import '../../choose_lang/choose_lang.dart';
import '../../menu_items/lang_dialog/change_lang_dialog.dart';
import '../../menu_items/terms_and_conditions/conditions.dart';
import '../../menu_items/center_classes/center_classes.dart';
import '../../menu_items/connect_us/connect_with_us.dart';
import '../../alerts/alerts.dart';
import '../../menu_items/center_departments/center_departments.dart';
import '../../menu_items/who_are_we/who_are_we.dart';
import '../../search/search.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  _MenuScreenState();

  Future<void> _showDialog() async {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String password;
    String newPassword;
    bool _obscuredText = true;
    bool _obscuredText1 = true;

    _toggle() {
      setState(() {
        _obscuredText = !_obscuredText;
      });
    }

    _toggle1() {
      setState(() {
        _obscuredText1 = !_obscuredText1;
      });
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .2),
                  Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(44),
                    ),
                    insetPadding: EdgeInsets.only(
                      right: 25,
                      left: 25,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10,bottom: 8),
                            child: Text(
                              'الرقم السرى القديم',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFFAAAAAA)),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: inputField(
                                    onChanged: (v) {},
                                    onSave: (value) {
                                        password = value;
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
                                    textInputType:
                                        TextInputType.visiblePassword,
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
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10,bottom: 8),
                                  child: Text(
                                    'الرقم السرى الجديد',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFFAAAAAA)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: inputField(
                                    onChanged: (v) {},
                                    onSave: (value) {
                                        newPassword = value;
                                    },
                                    secure: _obscuredText1,
                                    validate: (value) {
                                      if (value.toString().isEmpty) {
                                        return "enter password".tr().toString();
                                      } else if (value.toString().length < 8) {
                                        return 'weak password1'.tr().toString();
                                      }
                                      return null;
                                    },
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    icon: true,
                                    prefix: InkWell(
                                      onTap: _toggle1,
                                      child: Icon(
                                        Icons.visibility_outlined,
                                        color: _obscuredText1
                                            ? Colors.black12
                                            : Colors.black54,
                                        size: 17,
                                      ),
                                    ),
                                    hint: '',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              if (!_formKey.currentState.validate()) {
                                print('unValidated');
                                return;
                              } else {
                                _formKey.currentState.save();
                                ChangePassController.newPass(
                                  context: context,
                                  pass: password,
                                  newPass: newPassword,
                                );
                                // print(password);
                                // print(newPassword);
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                              height: 60,
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
                                  'save'.tr().toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AlertsScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'more'.tr().toString(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SearchScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MenuListTile(
                image: 'assets/icons/icon10.png',
                title: 'who are we'.tr().toString(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WhoAreWeScreen(),
                    ),
                  );
                },
              ),
              buildPadding(),
              MenuListTile(
                image: 'assets/icons/icon11.png',
                title: 'center departments'.tr().toString(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CenterDepartmentsScreen(),
                    ),
                  );
                },
              ),
              buildPadding(),
              MenuListTile(
                image: 'assets/icons/icon11.png',
                title: 'center classes'.tr().toString(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CenterClassesScreen(),
                    ),
                  );
                },
              ),
              if(SharedHelper.isLogged)
                buildPadding(),
              if(SharedHelper.isLogged)
                MenuListTile(
                image: 'assets/icons/icon12.png',
                title: 'change password'.tr().toString(),
                onTap: () {
                  _showDialog();
                },
              ),
              buildPadding(),
              MenuListTile(
                image: 'assets/icons/icon13.png',
                title: 'language'.tr().toString(),
                onTap: () {
                  showDialog1(context);
                },
              ),
              buildPadding(),
              MenuListTile(
                image: 'assets/icons/icon14.png',
                title: 'conditions'.tr().toString(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TermsAndConditionsScreen(),
                    ),
                  );
                },
              ),
              buildPadding(),
              MenuListTile(
                image: 'assets/icons/icon15.png',
                title: 'call us'.tr().toString(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ConnectUsScreen(),
                    ),
                  );
                },
              ),
              buildPadding(),
              if(SharedHelper.isLogged)
              MenuListTile(
                image: 'assets/icons/icon16.png',
                title: 'sign out'.tr().toString(),
                onTap: () {
                  SharedHelper.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>  ChooseLangScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Divider(
        color: Color(0xFF273370).withOpacity(0.1),
      ),
    );
  }
}

class MenuListTile extends StatelessWidget {
  const MenuListTile({
    Key key,
    this.image,
    this.title,
    this.onTap,
  }) : super(key: key);
  final String image, title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: double.infinity,
          height: 50,
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(7),
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF273370),
                  ),
                  child: Image.asset(image)),
              SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(color: Color(0xFF6A6A6A), fontSize: 14),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF6A6A6A),
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
