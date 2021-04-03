import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incubation_app/shared/shared_helper.dart';
import 'package:incubation_app/views/child_profile/models/chat.dart';
import 'package:incubation_app/views/child_profile/models/child_details.dart';
import 'package:incubation_app/views/child_profile/models/images.dart';
import 'package:incubation_app/views/child_profile/models/reports.dart';

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

  Future<ChatModel> getChat(int id)async{
    String username = SharedHelper.phone;
    String password = SharedHelper.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));


    final response = await http.get('https://superheroesland.com/wp-json/siteapi/v1/children/$id?get=chat',headers: {
      'authorization': basicAuth,
      'Authorization': '$basicAuth',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });
    ChatModel chatModel = ChatModel.fromJson(json.decode(response.body));
    return chatModel;
  }

  Future<ReportsModel> getReports(int id)async{
    String username = SharedHelper.phone;
    String password = SharedHelper.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(id);
    final response = await http.post('https://superheroesland.com/wp-json/siteapi/v1/children/$id?get=reports',headers: {
      'authorization': basicAuth,
      'Authorization': '$basicAuth',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    },
      // body: {'message': message,}
    );
    print(response.body);
    ReportsModel _reports = ReportsModel.fromJson(json.decode(response.body));
    return _reports;
  }

  Future<ImagesModel> getImages(int id)async{
    String username = SharedHelper.phone;
    String password = SharedHelper.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(id);
    final response = await http.get('https://superheroesland.com/wp-json/siteapi/v1/children/$id?get=images',headers: {
      'authorization': basicAuth,
      'Authorization': '$basicAuth',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    },
      // body: {'message': message,}
    );
    ImagesModel _images = ImagesModel.fromJson(json.decode(response.body));
    return _images;
  }

  Future<void> sendMessage(int id,String message)async{
    String username = SharedHelper.phone;
    String password = SharedHelper.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(id);
    final response = await http.post('https://superheroesland.com/wp-json/siteapi/v1/children/sendmessge/$id?messge=$message',headers: {
      'authorization': basicAuth,
      'Authorization': '$basicAuth',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    },
        // body: {'message': message,}
    );
    print(response.body);
  }
}