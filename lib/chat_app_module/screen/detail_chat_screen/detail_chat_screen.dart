import 'package:chat_app/chat_app_module/config/config.dart';
import 'package:chat_app/chat_app_module/screen/chat_screen/chat_list_widget.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:provider/provider.dart';

import '../../theme/helpers/language_helper.dart';
class ChatMessage {
  final String message;
  final int sender; // 0 for receiver, 1 for sender

  ChatMessage({required this.message, required this.sender});
}
class ChatDetailScreen extends StatelessWidget {

  final ChatList item;

  ChatDetailScreen({required this.item});
  final List<ChatMessage> messages = [
    ChatMessage(message: "Hello!", sender: 0),
    ChatMessage(message: "Hi, How are you? Hi, How are you? Hi, How are you?", sender: 1),
    ChatMessage(message: "I'm good, thank you!", sender: 0),
    ChatMessage(message: "Great to hear!", sender: 1),
    ChatMessage(message: "Hello!", sender: 0),
    ChatMessage(message: "Hi, How are you?", sender: 1),
    ChatMessage(message: "I'm good, thank you!", sender: 0),
    ChatMessage(message: "Great to hear!", sender: 1),
    ChatMessage(message: "Hello!", sender: 0),
    ChatMessage(message: "Hi, How are you?", sender: 1),
    ChatMessage(message: "I'm good, thank you!", sender: 0),
    ChatMessage(message: "Great to hear!", sender: 1),
  ];
  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0x1AE6E6E6),
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.title ?? "",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.message, size: 18,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(FontAwesomeIcons.listCheck, size: 18,),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
        Expanded(
        child: ListView.builder(
        itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return buildChatBubble(message, context);
          },
        ),
      ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.plus)),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppTheme.bgTextFieldColor(context),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          decoration: InputDecoration(

                            hintText: lang.chatTextField,
                           border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // Send message functionality here
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Widget buildChatBubble(ChatMessage message, BuildContext context) {
  bool isSender = message.sender == 1;

  // Determine the bubble color based on the sender and the current theme
  Color bubbleColor;
  if (isSender) {
    // For sender (1)
    bubbleColor = Theme.of(context).brightness == Brightness.light
        ? Color(0xDB002DE3) // Light mode color for sender
        : Color(0xE33860FF); // Dark mode color for sender
  } else {
    // For receiver (0)
    bubbleColor = Theme.of(context).brightness == Brightness.light
        ? Color(0xFFFFFFFF) // Light mode color for receiver
        : Color(0xFF0F1828); // Dark mode color for receiver
  }
  // color text
  Color textColor;

  if (isSender) {
    // Always return white color for sender (1)
    textColor = Colors.white;
  } else {
    // For receiver (0), check the theme
    if (Theme.of(context).brightness == Brightness.light) {
      textColor = Colors.black; // Light mode: black text
    } else {
      textColor = Colors.white; // Dark mode: white text
    }
  }

  return Align(
    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.only(left: isSender ? 80 : 0, right: isSender ? 0 : 80), // Adjust padding based on sender
      child: ClipPath(
        clipper: isSender
            ? LowerNipMessageClipper(MessageType.send) // For sender messages, use LowerNipMessageClipper
            : UpperNipMessageClipper(MessageType.receive), // For receiver messages, use UpperNipMessageClipper
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: bubbleColor, // Use the determined color
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message.message,
            style: TextStyle(fontSize: 16, color: textColor), // Set text color to black
          ),
        ),
      ),
    ),
  );
}
