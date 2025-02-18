import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/auth/user/user.dart';

class AppManager {
  final String _tokenKey = "tokenKey";
  final String _signedInStatusKey = "signedInStatusKey";
  final String _userInfoKey = "userInfo";

  // ==================== Token Management ====================
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<bool> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_tokenKey, token);
  }

  Future<bool> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_tokenKey);
  }

  // ==================== Signed-In Status ====================
  Future<bool> getSignedInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_signedInStatusKey) ?? false;
  }

  Future<bool> saveSignedInStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_signedInStatusKey, status);
  }

  // ==================== Logout ====================
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_signedInStatusKey);
    await prefs.remove(_userInfoKey);
  }

  // ==================== User Info ====================
  Future<UserModel> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userInfoKey);
    if (data == null) return const UserModel(); // Nếu không có user, trả về UserModel rỗng
    return UserModel.fromJson(json.decode(data));
  }

  Future<bool> saveUserInfo(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userInfoKey, jsonEncode(user.toJson()));
  }
}
