import 'dart:convert';

import 'package:http/http.dart' as http;

class BookServiceController {
  static Future sendBookService(childrenId) async {
    String url =
        "https://superheroesland.com/wp-json/siteapi/v1/service/booking/1779";

    String username = '01021692654';
    String password = 'sayed123';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    http.Response response = await http.post(url,
        body: {'children_id': childrenId},
        headers: <String, String>{'authorization': basicAuth});

    if (response.statusCode == 200) {
      print(response.body);
      print("HI");
    } else {
      print("Error");
    }
  }
}
