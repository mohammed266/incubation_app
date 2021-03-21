import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ChangePassController {
  static Future login({pass,newPass,context}) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/change_password";

    // String username = '$userName';
    // String password = '$pass';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$pass:$newPass'));
    Map<String,String> headers = {
      'Authorization' : 'Basic MDEwMjE2OTI2NTQ6c2F5ZWQxMjM=',
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    Map<String,String> body = {
      'old_password':'$pass',
      'new_password':'$newPass',
    };

    http.Response response = await http.post(url, headers: headers,body: body);

    if (response.statusCode == 200) {
      print(response.body);
      print("good");
    } else {
      print(response.body);
      print("Error");
    }
  }
}
