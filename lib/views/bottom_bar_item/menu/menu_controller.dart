import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:incubation_app/shared/shared_helper.dart';


class ChangePassController {
  static Future newPass({pass,newPass,context}) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/change_password";

    String username = SharedHelper.phone;
    String password = SharedHelper.password;
    String basicAuth = base64Encode(utf8.encode('$username:$password'));
    Map<String,String> headers = {
      'authorization': basicAuth,
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
      print(pass);
      print(newPass);
    } else {
      print(response.body);
      print("Error");
    }
  }
}
