import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/chat_app_module/theme/helpers/language_helper.dart';

class CacheThemeLogic extends ChangeNotifier {
  final _storage = FlutterSecureStorage();

  // Keys for storing theme and language information
  final _themeKey = 'theme_mode';
  final _langKey = 'language';

  // Default mode index (1 for light mode)
  int _modeIndex = 1;
  int get modeIndex => _modeIndex;

  // Language index (default 0 for English)
  int _lang = 0;
  CacheLanguage _cacheLang = cacheLageuageList[0];
  CacheLanguage get cacheLang => _cacheLang;

  Future<void> initCache() async {
    // Load theme mode from storage
    String? storedModeIndex = await _storage.read(key: _themeKey);
    if (storedModeIndex != null) {
      _modeIndex = int.parse(storedModeIndex);
    } else {
      _modeIndex = 1;
    }

    // Load language index from storage
    String? storedLangIndex = await _storage.read(key: _langKey);
    if (storedLangIndex != null) {
      _lang = int.parse(storedLangIndex);
      _cacheLang = cacheLageuageList[_lang];
    } else {
      _lang = 0;
    }

    notifyListeners(); // Update listeners when theme and language data is loaded
  }

  // Theme management
  void setThemeMode(int index) {
    _modeIndex = index;
    _storage.write(key: _themeKey, value: _modeIndex.toString());
    notifyListeners();
  }

  // Language management functions
  void changeToEnglish() {
    _setLanguage(0);
  }

  void changeToKhmer() {
    _setLanguage(1);
  }

  // Add more language change functions as needed
  void changeToChinese() {
    _setLanguage(2);
  }

  void changeToFrench() {
    _setLanguage(3);
  }

  // Internal function to update the language and store it
  void _setLanguage(int langIndex) {
    _lang = langIndex;
    _storage.write(key: _langKey, value: _lang.toString());
    _cacheLang = cacheLageuageList[_lang];
    notifyListeners(); // Notify listeners about language change
  }
}