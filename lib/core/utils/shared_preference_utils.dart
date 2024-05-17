import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  late SharedPreferences _prefs;

  SharedPreferencesUtils._();

  static final SharedPreferencesUtils _instance = SharedPreferencesUtils._();

  factory SharedPreferencesUtils() {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> _initialize() {
    return init();
  }

  Future<void> setToken(String token) async {
    await _initialize();
    _prefs.setString('token', token);
  }

  String? getToken() {
    if (!_isInitialized()) {
      print('SharedPreferences has not been initialized yet.');
    }
    return _prefs.getString('token');
  }

  Future<void> removeToken() async {
    await _initialize();
    await _prefs.remove('token');
  }

  bool _isInitialized() {
    if (_prefs == null) {
      if (kDebugMode) {
        print('SharedPreferences has not been initialized yet.');
      }
      return false;
    }
    return true;
  }
}
