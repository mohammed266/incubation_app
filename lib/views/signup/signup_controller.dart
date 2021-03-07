import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:incubation_app/views/activation_code/activation_code.dart';

class SignUpController {

  static Future signUp({thirdName, pass, email, phone,context}) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/register";

    Map<String,String> headers = {
      'User-Agent': 'PostmanRuntime/7.26.8',
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

    if (response.statusCode == 200) {
      print(response.body);
      print(pass);
      print(phone);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PinCodeVerificationScreen(pass: pass,phoneNumber: phone,),
        ),
      );
      print("HI");
    } else {
      print(response.body);
      print("Error");
    }
  }
}
