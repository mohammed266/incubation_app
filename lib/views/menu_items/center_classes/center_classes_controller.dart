import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:incubation_app/views/home/home.dart';
import 'center_classes_model.dart';

class CenterClassesController {
  List<CenterClassesModel> listOfClasses = [];
  bool loading = true;
  Future getCenterClasses() async {
    String url = "https://superheroesland.com/wp-json/wp/v2/classes?page=1&per_page=22";

    http.Response response = await http.get(url, headers: {
      'Cookie': 'PHPSESSID=dd3667b54c7e3d25c556cbaffd745863',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });
    var responseDecoded = json.decode(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      for (var classes in responseDecoded) {
        listOfClasses.add(CenterClassesModel.fromJson(classes));
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
