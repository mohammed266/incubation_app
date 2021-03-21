import 'dart:convert';
import 'package:http/http.dart' as http;
import 'center_department_model.dart';


class CenterDepartmentController {
  List<CenterDepartmentModel> listOfCenterDep = [];
  bool loading = true;
  Future getCenterDepartment() async {
    String url = "https://superheroesland.com/wp-json/wp/v2/centers?page=1&per_page=22";

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
        listOfCenterDep.add(CenterDepartmentModel.fromJson(classes));
      }
      print("good");
    } else {
      print(response.body);
      print("Error");
    }
  }
}
