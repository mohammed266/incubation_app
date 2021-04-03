import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incubation_app/shared/shared_helper.dart';
import 'package:incubation_app/views/book_service/models/services.dart';
import 'package:incubation_app/views/menu_items/center_classes/center_classes_model.dart';
import 'search_model.dart';




class SearchController {
  List<SearchModel> listOfSearch = [];
  bool loading = true;

  Future<List<CenterClassesModel>> getCenterClasses() async {
    List<CenterClassesModel> listOfClasses = [];
    String url = "https://superheroesland.com/wp-json/wp/v2/classes?page=1&per_page=100";

    http.Response response = await http.get(url, headers: {
      'Cookie': 'PHPSESSID=dd3667b54c7e3d25c556cbaffd745863',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });
    var responseDecoded = json.decode(response.body);
    if (response.statusCode == 200) {
      for (var classes in responseDecoded) {
        listOfClasses.add(CenterClassesModel.fromJson(classes));
      }
      print("good");
    } else {
      print(response.body);
      print("Error");
    }
    return listOfClasses;
  }

  Future getSearch({List filter, String search}) async {

    String url = "https://superheroesland.com/wp-json/wp/v2/search?search=$search";

    http.Response response = await http.get(url, headers: {
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });
    var responseDecoded = json.decode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      for (var item in responseDecoded) {
        listOfSearch.add(SearchModel.fromJson(item));
      }
      print("good yas66a");
    } else {
      print(response.body);
      print("Error");
    }
  }
}