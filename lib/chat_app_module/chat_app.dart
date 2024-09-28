import 'package:chat_app/chat_app_module/screen/greeting_screen/greeting_screen.dart';
import 'package:chat_app/chat_app_module/screen/main_screen/main_screen.dart';
import 'package:chat_app/chat_app_module/screen/setup_profile_screen/setup_profile_screen.dart';
import 'package:chat_app/chat_app_module/screen/verification_screen/code_verification_screen.dart';
import 'package:chat_app/chat_app_module/screen/verification_screen/phone_verification.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
