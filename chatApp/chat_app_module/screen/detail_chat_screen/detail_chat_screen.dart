import 'package:chat_app/chat_app_module/screen/chat_screen/chat_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    ChatMessage(message: "Hi, How are you?", sender: 1),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x1AE6E6E6),
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
            return buildChatBubble(message);
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
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          decoration: InputDecoration(

                            hintText: "Type a message...",
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
Widget buildChatBubble(ChatMessage message) {
  bool isSender = message.sender == 1; // 1 means the sender (right), 0 means receiver (left)

  return Align(
    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSender ? Colors.blue[200] : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        message.message,
        style: TextStyle(fontSize: 16),
      ),
    ),
  );
}

