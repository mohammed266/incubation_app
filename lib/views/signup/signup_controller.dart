import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:incubation_app/views/alerts/alerts_controller.dart';
import 'package:incubation_app/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController {
  static savePref({String phone, String pass,}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("phone", phone);
    preferences.setString("password", pass);
    preferences.setBool("saveSession", true);
  }
  static Future signUp({thirdName, pass, email, phone,context}) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/register";

    Map<String,String> headers = {
      'Cookie': 'PHPSESSID=dd3667b54c7e3d25c556cbaffd745863',
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    Map<String,String> body = {
      'third_name':'$thirdName',
      'phone':'$phone',
      'email':'$email',
      'password':'$pass',
    };


    http.Response response = await http.post(url,body: body, headers: headers);
    try{
      json.decode(response.body);
      print(response.body);
      savePref(phone: phone,pass: pass);
      final fcm =await FirebaseMessaging().getToken();
      await AlertsController.alerts(
        pass: pass,
        userName: phone,
        token: fcm,
        context: context,
      );
      print("good");
      Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
    }catch (e){
      print(e);
      Fluttertoast.showToast(
        msg: e.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black12,
        textColor: Color(0xFF273370),
        fontSize: 14.0,
      );
    }
  }
}
