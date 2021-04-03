import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:incubation_app/views/alerts/alerts_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home/home.dart';

class LoginController {
  static savePref({String phone, String pass, bool saveSession}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("phone", phone);
    preferences.setString("password", pass);
    preferences.setBool("saveSession", saveSession);
  }
  static Future login(userName,pass,context,saveSession) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/login";

    String basicAuth = base64Encode(utf8.encode('$userName:$pass'));

    http.Response response = await http.post(url, headers: {
      'authorization': basicAuth,
      'Authorization': 'Basic $basicAuth',
      'Cookie': 'PHPSESSID=8c700251b0fc794cb19c47ccc54da3a8; pll_language=en',
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Content-Length': '0',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });
    try{
      json.decode(response.body) as Map;
      print(response.body);
      savePref(phone: userName,pass: pass,saveSession: saveSession);
      final fcm =await FirebaseMessaging().getToken();
      await AlertsController.alerts(
        pass: pass,
        userName: userName,
        token: fcm,
        context: context,
      );
      Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
      print("good");
    } catch(e){
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
