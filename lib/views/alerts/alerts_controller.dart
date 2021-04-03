import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incubation_app/shared/shared_helper.dart';
import 'package:incubation_app/views/alerts/alerts_models.dart';

class AlertsController {
  AlertsModel alertsModel = AlertsModel();

  static Future alerts({userName, pass, token, context}) async {
    String url =
        "https://superheroesland.com/wp-json/siteapi/v1/Auth/send_token?token=AAAAjC4gCCU:APA91bFtrQfc2JxmxsyfPtakA4s6wgv5CRuSSrG0qnCO8dVowbQKdATyYtEjaVA1bLVLKl7dmAsbu4PdULuGWZ9-03vO2kWyt8TmwmmOPjPUYoRU4EaLJOi2fwSHL6TLC6QIT23sGEzv";

    String username = SharedHelper.phone;
    String pass = SharedHelper.password;
    String basicAuth = base64Encode(utf8.encode('$username:$pass'));

    Map<String, String> headers = {
      'authorization': basicAuth,
      'Authorization': 'Basic MDEwMjE2OTI2NTQ6c2F5ZWQxMjM=',
      'Cookie': 'PHPSESSID=dd3667b54c7e3d25c556cbaffd745863',
      'Content-Length': '0',
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    http.Response response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      print(pass);
      print(userName);
      print(token);
      print("HI");
      // print(password);
      // print(username);
    } else {
      print(response.body);
      print("Error ya 7ywaaan");
    }
  }

  Future<AlertsModel> getAlertsData() async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/get_notificatin";
    print('ll');

    String username = SharedHelper.phone;
    String pass = SharedHelper.password;
    String basicAuth = base64Encode(utf8.encode('$username:$pass'));

    Map<String, String> headers = {
      'authorization': basicAuth,
      'Authorization': 'Basic MDEwMjE2OTI2NTQ6c2F5ZWQxMjM=',
      'Cookie': 'PHPSESSID=8c700251b0fc794cb19c47ccc54da3a8; pll_language=en',
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };
    http.Response response = await http.get(url, headers: headers);
    var responseDecoded = json.decode(response.body);

    if (response.statusCode == 200) {
      alertsModel = AlertsModel.fromJson(responseDecoded);
      print('good');
    } else {
      print('error');
    }
    return alertsModel;
  }
}
