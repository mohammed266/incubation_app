import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginController {
  static Future login(userName,pass) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/login";

    String username = '01019061970';
    String password = 'sayed123';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    http.Response response = await http.post(url, headers: {
      'authorization': basicAuth,
      'Authorization': 'Basic MDEwMTkwNjE5NzA6c2F5ZWQxMjM=',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });

    if (response.statusCode == 200) {
      print(response.body);
      print("HI");
    } else {
      print(response.body);
      print("Error");
    }
  }
}
