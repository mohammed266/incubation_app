import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:incubation_app/views/bottom_bar_item/home/home_model.dart';

class HomeController {
  List sliderUrl = [];
  List<ServiceModel> listOfService = [];
  bool loading = true;

  Future getSliderData() async {
    String url =
        "https://superheroesland.com/wp-json/siteapi/v1/options/slider";

    http.Response response = await http.get(url, headers: {
      'Cookie': 'PHPSESSID=dd3667b54c7e3d25c556cbaffd745863',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });

    var responseDecoded = json.decode(response.body);

    if (response.statusCode == 200) {
      sliderUrl = responseDecoded;
      print(responseDecoded);
    } else {
      print('error');
    }
  }

  Future getService() async {
    String url = "https://superheroesland.com/wp-json/wp/v2/services?page=1&per_page=9";

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
      for (var classes in responseDecoded) {
        listOfService.add(ServiceModel.fromJson(classes));
      }
      print("good");
    } else {
      print(response.body);
      print("Error");
    }
  }

}
