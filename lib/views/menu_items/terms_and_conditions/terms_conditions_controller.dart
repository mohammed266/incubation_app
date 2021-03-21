import 'dart:convert';
import 'package:http/http.dart' as http;
import 'terms_conditions_model.dart';

class TermsAndConditionsController {
  List<TermsConditionsModel> listOfTerms = [];
  bool loading = true;
  Future getTermsConditions() async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/page/terms";

    http.Response response = await http.get(url, headers: {
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });
    var responseDecoded = json.decode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      for (var classes in responseDecoded) {
        listOfTerms.add(TermsConditionsModel.fromJson(classes));
      }
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => HomeScreen(),
      //   ),
      // );
      print("good");
    } else {
      print(response.body);
      print("Error");
    }
  }
}
