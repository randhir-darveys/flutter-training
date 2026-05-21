import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const String isLoggedInKey = 'isLoggedIn';
  static const String emailKey = 'email';

  Future<void> saveLogin(String email) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(isLoggedInKey, true);
    await prefs.setString(emailKey, email);
  }

  Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(isLoggedInKey) ?? false;
  }

  Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(emailKey) ?? '';
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(isLoggedInKey);
    await prefs.remove(emailKey);
  }
}