import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/chat_app_module/theme/helpers/language_helper.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';

class LanguageChangeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the current language from CacheThemeLogic
    final cacheLang = Provider.of<CacheThemeLogic>(context).cacheLang;

    return Scaffold(
      appBar: AppBar(
        title: Text(cacheLang.language), // Dynamic title based on the selected language
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // English Language Sele
            // ction
            ListTile(
              title: Text('English'),
              trailing: Switch(
                value: context.watch<CacheThemeLogic>().cacheLang == cacheLageuageList[0], // English is selected
                onChanged: (bool value) {
                  if (value) {
                    context.read<CacheThemeLogic>().changeToEnglish(); // Change to English
                  }
                },
              ),
            ),
            SizedBox(height: 10),

            // Khmer Language Selection
            ListTile(
              title: Text('Khmer'),
              trailing: Switch(
                value: context.watch<CacheThemeLogic>().cacheLang == cacheLageuageList[1], // Khmer is selected
                onChanged: (bool value) {
                  if (value) {
                    context.read<CacheThemeLogic>().changeToKhmer(); // Change to Khmer
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
