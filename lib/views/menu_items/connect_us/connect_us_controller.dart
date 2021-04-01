import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:incubation_app/views/menu_items/connect_us/connect_us_model.dart';
import 'package:url_launcher/url_launcher.dart';


class ConnectUsController {
  ConnectUsModel connectUsModel;
  GlobalKey<FormState> connectKey = GlobalKey<FormState>();
  List latLog = [];
  bool loading = true;
  Future getConnectUs() async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/page/contact";

    http.Response response = await http.get(url, headers: {
      'Cookie': 'PHPSESSID=dd3667b54c7e3d25c556cbaffd745863',
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });
    var responseDecoded = json.decode(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      connectUsModel = ConnectUsModel.fromJson(responseDecoded);

      latLog = connectUsModel.latLong.split(",");
      print(latLog);
      print(responseDecoded['google_map_iframe']);
      print("good");
    } else {
      print(response.body);
      print("Error");
    }
  }


  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  Future sentContact({name,email,ddl,message}) async{
    String url = "https://superheroesland.com/wp-json/contact-form-7/v1/contact-forms/460/feedback";
    Map<String,String> headers = {
      'Cookie': 'PHPSESSID=dd3667b54c7e3d25c556cbaffd745863',
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    Map<String,String> body = {
      'your-name':'$name',
      'your-email':'$email',
      'ddl':'$ddl',
      'your-message':'$message',
    };


    http.Response response = await http.post(url,body: body, headers: headers);

    if (response.statusCode == 200) {
      print(response.body);

      print("HI");
    } else {
      print(response.body);
      print("Error");
    }
  }
}
