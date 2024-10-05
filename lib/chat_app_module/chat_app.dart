// chat_app.dart
import 'package:chat_app/chat_app_module/screen/greeting_screen/greeting_screen.dart';
import 'package:chat_app/chat_app_module/screen/main_screen/main_screen.dart';
import 'package:chat_app/chat_app_module/theme/switch_theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:chat_app/chat_app_module/theme/switch_language_screen.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CacheThemeLogic()..initCache(),
      child: Consumer<CacheThemeLogic>(
        builder: (context, themeLogic, child) {
          ThemeMode themeMode;
          switch (themeLogic.modeIndex) {
            case 1:
              themeMode = ThemeMode.dark;
              break;
            case 2:
              themeMode = ThemeMode.light;
              break;
            case 3:
              themeMode = ThemeMode.system;
              break;
            default:
              themeMode = ThemeMode.system;
          }

          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeMode, // Apply the selected theme mode here
            home: GreetingScreen(),
          );
        },
      ),
    );
  }
}