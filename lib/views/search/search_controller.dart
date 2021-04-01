import 'dart:convert';
import 'package:http/http.dart' as http;
import 'search_model.dart';




class SearchController {
  List<SearchModel> listOfSearch = [];
  bool loading = true;
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