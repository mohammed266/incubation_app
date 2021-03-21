import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../home/home.dart';

class LoginController {
  static Future login(userName,pass,context) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/login";

    String username = '$userName';
    String password = '$pass';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    http.Response response = await http.post(url, headers: {
      'authorization': basicAuth,
      'Authorization': 'Basic $basicAuth',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });

    if (response.statusCode == 200) {
      print(response.body);

      print("good");
    } else {
      print(response.body);
      print("Error");
    }
  }
}
