import 'package:http/http.dart' as http;

class ForgetPassController {
  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Future forgetPass({String email}) async {
    String url =
        'https://superheroesland.com/wp-json/siteapi/v1/Auth/reset_password';

    http.Response response = await http.post(
      url,
      headers: {
        'Cookie': 'PHPSESSID=c11b3b87fdbc58d13a65afaa0a38ba96',
        'User-Agent': 'PostmanRuntime/7.26.10',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
      body: {
        'email' : '$email',
      },
    );
    if(response.statusCode == 200){
      print(response.body);
      print("good");
      print(email);
    }else{
      print(response.body);
      print("Error");
    }
  }
}
