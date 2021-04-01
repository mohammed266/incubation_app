import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {

  static SharedPreferences _preferences;
  static bool isLogged = false;
  static String phone,password;
  static Future<bool> getSaveSession()async{
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool('saveSession');
  }

  static Future<void> signOut()async{
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
  }

  static Future<bool> logged()async{
    _preferences = await SharedPreferences.getInstance();
    final _isLogged = _preferences.getString('phone');
    phone = _preferences.getString('phone');
    password = _preferences.getString('password');
    isLogged = (_isLogged != null);
    return (_isLogged != null);
  }

}