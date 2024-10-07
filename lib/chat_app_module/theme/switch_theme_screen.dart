import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';

import 'helpers/language_helper.dart';

class DarkModeSelectionScreen extends StatefulWidget {
  @override
  _DarkModeSelectionScreenState createState() => _DarkModeSelectionScreenState();
}

class _DarkModeSelectionScreenState extends State<DarkModeSelectionScreen> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    int modeIndex = context.read<CacheThemeLogic>().modeIndex;
    _selectedOption = _mapIndexToOption(modeIndex);
  }

  String _mapIndexToOption(int index) {
    switch (index) {
      case 1:
        return 'On';
      case 2:
        return 'Off';
      case 3:
        return 'System';
      default:
        return 'On';
    }
  }

  int _mapOptionToIndex(String option) {
    switch (option) {
      case 'On':
        return 1;
      case 'Off':
        return 2;
      case 'System':
        return 3;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.darkMode),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          RadioListTile<String>(
            title: Text(lang.changeToDarkMode),
            value: 'On',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
              context.read<CacheThemeLogic>().setThemeMode(_mapOptionToIndex(value!));
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile<String>(
            title: Text(lang.chaneToLightMode),
            value: 'Off',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
              context.read<CacheThemeLogic>().setThemeMode(_mapOptionToIndex(value!));
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile<String>(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lang.changeToSystemMode),
                SizedBox(height: 4),
                Text(
                  lang.changeToSystemModeDetail,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            value: 'System',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
              context.read<CacheThemeLogic>().setThemeMode(_mapOptionToIndex(value!));
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ],
      ),
    );
  }
}