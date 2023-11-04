import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _authTokenKey = 'auth_token';


  // Store the authentication token.
  Future<void> storeAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authTokenKey, token);
  }

  // Retrieve the authentication token.
  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authTokenKey);
  }

  // Remove the authentication token.
  Future<void> removeAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
  }


  Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
    await prefs.clear();
  }
}