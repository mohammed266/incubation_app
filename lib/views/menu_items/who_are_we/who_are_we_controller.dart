import 'dart:convert';
import 'package:http/http.dart' as http;
import 'who_are_we_model.dart';


class WhoAreWeController {
  List<WhoAreWeModel> listOfWhoAreWe = [];
  bool loading = true;
  Future getWhoAreWe() async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/page/about";

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
        listOfWhoAreWe.add(WhoAreWeModel.fromJson(classes));
      }
      print("good");
    } else {
      print(response.body);
      print("Error");
    }
  }
}
