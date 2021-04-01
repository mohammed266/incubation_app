import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:incubation_app/shared/shared_helper.dart';
import '../home/home.dart';

class AddChildController {
  //Form Keys
  GlobalKey<FormState> babyInformationKey = GlobalKey<FormState>();
  GlobalKey<FormState> attendanceAndDepartureKey = GlobalKey<FormState>();
  GlobalKey<FormState> medicalInformationKey = GlobalKey<FormState>();
  GlobalKey<FormState> requiredDocumentsKey = GlobalKey<FormState>();

  //Vars
  String childName;
  String childGender;
  String childBirth;
  String childRelativeRelation;
  String childAddress;
  String childState;
  String childEducationLevel;
  String person1CallThirdName;
  String person1CallPhone;
  String person1CallRelativeRelation;
  String person2CallThirdName;
  String person2CallPhone;
  String person2CallRelativeRelation;
  String person1AllowTakeChildThirdName;
  String person1AllowTakeChildPhone;
  String person1AllowTakeChildRelativeRelation;
  String person2AllowTakeChildThirdName;
  String person2AllowTakeChildPhone;
  String person2AllowTakeChildRelativeRelation;
  bool childAllergyFood;
  bool childOtherAllergy;
  bool childSymptomsShockAllergy;
  bool isChildWithSpecialSeeds;
  String childOtherDiseases;
  File childImage;
  File familyCardImage;
  File childDateImage;
  File childVaccinationCardImage;
  File childMedicalImage;
  bool acceptTermsAndConditions = false;
  bool acceptPublishImages = false;

  Future addChild(
      {childName,
      childGender,
      childBirth,
      childRelativeRelation,
      childAddress,
      childState,
      childEducationLevel,
      person1CallThirdName,
      person1CallPhone,
      person1CallRelativeRelation,
      person2CallThirdName,
      person2CallPhone,
      person2CallRelativeRelation,
      person1AllowTakeChildThirdName,
      person1AllowTakeChildPhone,
      person1AllowTakeChildRelativeRelation,
      person2AllowTakeChildThirdName,
      person2AllowTakeChildPhone,
      person2AllowTakeChildRelativeRelation,
      childAllergyFood,
      childOtherAllergy,
      childSymptomsShockAllergy,
      isChildWithSpecialSeeds,
      childOtherDiseases,
      File childImage,
      File familyCardImage,
      File childDateImage,
      File childVaccinationCardImage,
      File childMedicalImage,
      acceptTermsAndConditions,
      acceptPublishImages,
      context}) async {
    String url = "https://superheroesland.com/wp-json/siteapi/v1/children";

    String username = SharedHelper.phone;
    String password = SharedHelper.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    print(childImage.path);
    print(familyCardImage.path);
    print(childDateImage.path);
    print(childVaccinationCardImage.path);
    print(childMedicalImage.path);

    var request = http.MultipartRequest('POST', Uri.parse(url));
    var headers = {
      'authorization': basicAuth,
      'Authorization': 'Basic MDEwMjE2OTI2NTQ6c2F5ZWQxMjM=',
      'User-Agent': 'PostmanRuntime/7.26.8',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive',
    };

    request.fields.addAll({
      'child_third_name': childName,
      'gender': childGender,
      'birth_date': childBirth,
      'relation': childRelativeRelation,
      'adress': childAddress,
      'is_register_in_school': '$childState',
      'l_stage': childEducationLevel,
      'contact_1_name': person1CallThirdName,
      'contact_1_phone': person1CallPhone,
      'contact_1_relation': person1CallRelativeRelation,
      'contact_2_name': person2CallThirdName,
      'contact_2_phone': person2CallPhone,
      'contact_3_relation': person2CallRelativeRelation,
      'leav_1_name': person1AllowTakeChildThirdName,
      'leav_1_phone': person1AllowTakeChildPhone,
      'leav_1_relation': person1AllowTakeChildRelativeRelation,
      'leav_2_name': person2AllowTakeChildThirdName,
      'leav_2_phone': person2AllowTakeChildPhone,
      'leav_2_relation': person2AllowTakeChildRelativeRelation,
      'child_sensitivity': '$childAllergyFood',
      'child_sensitivity_other': '$childOtherAllergy',
      'adrina_give': '$childSymptomsShockAllergy',
      'this_child_special': '$isChildWithSpecialSeeds',
      'child_health': childOtherDiseases
    });

    request.files
        .add(await http.MultipartFile.fromPath('child_photo', childImage.path));
    request.files.add(await http.MultipartFile.fromPath(
        'children_photo_card', familyCardImage.path));
    request.files.add(await http.MultipartFile.fromPath(
        'child_birth_cert', childDateImage.path));
    request.files.add(await http.MultipartFile.fromPath(
        'child_af', childVaccinationCardImage.path));
    request.files.add(await http.MultipartFile.fromPath(
        'child_medic_cert', childMedicalImage.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  final picker = ImagePicker();

  Future childGetImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      childImage = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future familyImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      familyCardImage = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future childGetDateImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      childDateImage = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future childGetVaccinationCardImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      childVaccinationCardImage = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future childGetMedicalImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      childMedicalImage = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
}
