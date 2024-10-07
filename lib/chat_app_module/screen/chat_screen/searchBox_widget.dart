import 'package:chat_app/chat_app_module/config/config.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/helpers/language_helper.dart';
class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({super.key});

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          // color: Color(0x91E0E0E8),
          color: AppTheme.bgTextFieldColor(context), // Light mode color,,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(

          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: lang.chatSearchBox,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
