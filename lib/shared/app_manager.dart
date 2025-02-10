import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/auth/user/user.dart';

class AppManager {
  final String _firstTimeOpenAppKey = "firstTimeOpenAppKey";
  final String _tokenKey = "tokenKey";
  final String _firebaseTokenKey = "firebaseTokenKey";
  final String _languageKey = "languageKey";
  final String _searchHistoryKey = "searchHistoryKey";
  final String _userInfo = "userInfo";
  final String _biometicLogin = "biometicLogin";
  final String _signedInStatus = "signedInStatus";

  AppManager();

  Future<bool> isFirstTimeOpenApp() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getBool(_firstTimeOpenAppKey) ?? true;
    return data;
  }

  Future<bool> saveIsFirstTimeOpenApp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_firstTimeOpenAppKey, false);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_tokenKey);
    return data;
  }

  Future<String?> getFirebaseToken() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_firebaseTokenKey);
    return data;
  }

  Future<UserModel> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userInfo);
    if (data == null) return const UserModel();
    final map = json.decode(data);
    UserModel userResponse = UserModel.fromJson(map);
    return userResponse;
  }

  Future<bool> saveUserInfo({required UserModel user}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userInfo, jsonEncode(user));
  }

  Future<bool> saveToken({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_tokenKey, jsonEncode(token));
  }

  Future<bool> saveFirebaseToken({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_firebaseTokenKey, token);
  }

  Future<bool> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_tokenKey);
  }

  // Future<String> getLanguageKey() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final data = prefs.getString(_languageKey) ?? AppLanguage.vi.toString();
  //   return data;
  // }

  Future<bool> saveLanguageKey({required String language}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_languageKey, language);
  }

  Future<bool> saveSearchHistory(
      {required List<String> listSearchHistory}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setStringList(_searchHistoryKey, listSearchHistory);
  }

  Future<List<String>> getSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_searchHistoryKey) ?? [];
    return data;
  }

  Future<bool> saveBiometicLogin({required bool biometicLogin}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_biometicLogin, biometicLogin);
  }

  Future<bool> getBiometicLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getBool(_biometicLogin) ?? false;
    return data;
  }

  Future<bool> saveSignedInStatus({required bool signedInStatus}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_signedInStatus, signedInStatus);
  }

  Future<bool> getSignedInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getBool(_signedInStatus) ?? false;
    return data;
  }
}
