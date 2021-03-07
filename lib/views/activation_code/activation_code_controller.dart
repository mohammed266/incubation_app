import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:incubation_app/views/activation_code/activation_code.dart';

class ActivationCodeController {
  static Future activationCode({userName, pass, context}) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/verify";

    String username = '$userName';
    String password = '$pass';
    print("Username:$username");
    print("Pass:$password");
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    Map<String, String> headers = {
      'authorization': basicAuth,
      'Authorization': 'Basic MDEwOTQ1MTkyMjE6bWVkbzEyMw==',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    http.Response response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      print("Active");
      print("HI");
    } else {
      print(response.body);
      print("Error");
    }
  }

  static Future checkCode({userName, pass, code, context}) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/check";

    String username = '$userName';
    String password = '$pass';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    Map<String, String> headers = {
      'authorization': basicAuth,
      'Authorization': 'Basic MDEwMjE2OTI2NTQ6c2F5ZWQxMjM=',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    Map<String, String> body = {'code': code};

    http.Response response = await http.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => PinCodeVerificationScreen("+8801376221100"),
      //   ),
      // );
      print("HI");
      print("Right CODE");
    } else {
      print(response.body);
      print("Error");
    }
  }
}
