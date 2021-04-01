import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incubation_app/shared/toast.dart';
import 'package:incubation_app/views/book_service/models/children.dart';
import 'package:incubation_app/views/book_service/models/services.dart';
import 'package:incubation_app/views/bottom_bar_item/home/home_model.dart';

class BookServiceController {

  ChildrenModel _childrenModel = ChildrenModel();

  Future<List<ChildrenModel>> getChildren()async{
    List<ChildrenModel> childrenList = [];
    String url = "https://superheroesland.com/wp-json/siteapi/v1/children";
    String username = '01021692654';
    String password = 'sayed123';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    http.Response response = await http.get(url, headers: <String, String>{'authorization': basicAuth});
    if(response.statusCode == 200) {
      final data = json.decode(response.body) ;
      data.forEach((element) {
        _childrenModel = ChildrenModel.fromJson(element);
        childrenList.add(_childrenModel);
      });
    }
    return childrenList;
  }
  ServicesModel _servicesModel = ServicesModel();

  Future<List<ServicesModel>> getServices()async{
    List<ServicesModel> servicesList = [];
    String url = "https://superheroesland.com/wp-json/wp/v2/services";
    String username = '01021692654';
    String password = 'sayed123';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    http.Response response = await http.get(url, headers: <String, String>{'authorization': basicAuth});
    if(response.statusCode == 200) {
      final data = json.decode(response.body);
      data.forEach((element) {
        _servicesModel = ServicesModel.fromJson(element);
        servicesList.add(_servicesModel);
      });
    }
    return servicesList;
  }


  Future sendBookService({childId , serviceId,date}) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/service/booking/$serviceId";

    String username = '01021692654';
    String password = 'sayed123';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

    http.Response response = await http.post(url,
        body: {'children_id': childId.toString()},
        headers: <String, String>{'authorization': basicAuth});
    try{
      final data = json.decode(response.body) as Map;
      showToast(data['msg']);
    }catch (e){
      showToast(e.message);
    }
  }
}
