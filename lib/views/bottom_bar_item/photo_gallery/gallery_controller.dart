import 'dart:convert';
import 'package:http/http.dart' as http;
import 'gallery_model.dart';

class GalleryController {

  List<GalleryModel> galleryModel = [];
  bool loading = true;

  Future getGalleryData() async {
    String url =
        "https://superheroesland.com/wp-json/wp/v2/gallery?page=1&per_page=3";

    http.Response response = await http.get(url, headers: {
      // 'authorization': basicAuth,
      // 'Authorization': 'Basic $basicAuth',
      'Cookie': 'PHPSESSID=dd3667b54c7e3d25c556cbaffd745863',
      'Authorization': 'Basic MDEwMjE2OTI2NTQ6c2F5ZWQxMjM=',
      'User-Agent': 'PostmanRuntime/7.26.10',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });
    var responseDecoded = json.decode(response.body);

    print("Start");

    if (response.statusCode == 200) {
      for (var item in responseDecoded) {
        galleryModel.add(GalleryModel.fromJson(item));
      }

      print(galleryModel[2].name);
      // print(responseDecoded['name']);
    } else {
      print("Error");
    }
  }
}
