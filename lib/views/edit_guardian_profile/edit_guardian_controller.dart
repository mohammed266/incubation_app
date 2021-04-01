import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditGuardianController {
  bool loading = false;
  String thirdName, phone, email, pass, address;
  File imagePath;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future guardianData(thirdName, phone, email, pass, address, imagePath) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/Auth/update";

    loading = true;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll({
      'Authorization': 'Basic MDEwMjE2OTI2NTQ6c2F5ZWQxMjM=',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    });

    request.fields['third_name'] = thirdName;
    request.fields['phone'] = phone;
    request.fields['email'] = email;
    request.fields['password'] = pass;
    request.fields['adress'] = address;
    request.files
        .add(await http.MultipartFile.fromPath('profile_img', imagePath));
    // var responseDecoded = json.decode(response.body);

    print("Start");

    var response = await request.send();

    response.stream.transform(utf8.decoder).listen((response) {
      var responseDecoded = json.decode(response);
      if (responseDecoded == 200) {
        print(responseDecoded);
      } else {
        print("Error");
        print(responseDecoded);
      }
    });
  }

  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      return image;
    } else {
      print('No image selected.');
    }
  }
}
