import 'dart:convert';
import 'package:http/http.dart' as http;
import 'guardian_model.dart';


class GuardianController {
  List<GuardianModel> listOfChild = [];
  bool loading = true;
  Future getGuardian() async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/children";
    String username = '01021692754';
    String password = 'sayed223';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    http.Response response = await http.get(url, headers: {
      'Authorization' : 'Basic MDEwMjE2OTI2NTQ6c2F5ZWQxMjM=',
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });
    var responseDecoded = json.decode(response.body);
    if (response.statusCode == 200) {
      print(responseDecoded);
      for (var classes in responseDecoded) {
        print(classes);
        listOfChild.add(GuardianModel.fromJson(classes));
      }
      // print(listOfChild[0].name);
      print("good");

    } else {
      print(response.body);
      print("Error");
    }
  }
}
