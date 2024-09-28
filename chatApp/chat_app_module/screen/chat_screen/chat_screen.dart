import 'package:chat_app/chat_app_module/screen/chat_screen/chat_list_widget.dart';
import 'package:chat_app/chat_app_module/screen/chat_screen/searchBox_widget.dart';
import 'package:chat_app/chat_app_module/screen/chat_screen/story_list.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/chat_app_module/screen/contact_screen/contact_list_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ChatScreen> {
  bool _stretch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0x1AE6E6E6),
        // titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Chats",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
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
                    icon: FaIcon(FontAwesomeIcons.listCheck,size: 18,),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [

            SliverToBoxAdapter(

              child: StoryListWidget(),
            ),
            SliverToBoxAdapter(
              child:  Padding(
                padding: EdgeInsets.only(top: 10),
                  child: Divider(height: 1, color: Color(0x267D7D7D))),
            ),
            SliverToBoxAdapter(
              child: SearchBoxWidget(),
            ),

            SliverToBoxAdapter(
              child: ChatListWidget(),
            )

          ],
        ),
      ),
    );
  }
}
