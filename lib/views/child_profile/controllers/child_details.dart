import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incubation_app/shared/shared_helper.dart';
import 'package:incubation_app/views/child_profile/models/child_details.dart';

class ChildDetailsController {

  ChildDetailsModel _childDetailsModel = ChildDetailsModel();

  Future<ChildDetailsModel> getDetails(int id)async{

    //TODO: change to username pass from sharedprefs
    String username = SharedHelper.phone;
    String password = SharedHelper.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));


    final response = await http.get('https://superheroesland.com/wp-json/siteapi/v1/children/$id',headers: {
    'authorization': basicAuth,
    'Authorization': '$basicAuth',
    'User-Agent': 'PostmanRuntime/7.26.8',
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
    });
    print(response.body);
    _childDetailsModel = ChildDetailsModel.fromJson(json.decode(response.body));
    return _childDetailsModel;
  }

  Future<void> sendMessage()async{

  }
}