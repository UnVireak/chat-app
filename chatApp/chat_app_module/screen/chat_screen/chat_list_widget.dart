import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../detail_chat_screen/detail_chat_screen.dart';

class ChatListWidget extends StatefulWidget {
  @override
  _ChatListWidgetState createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  List<ChatList> itemList = [
    ChatList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "IShowSpeed",
      contentMessage: "Ey yo bro what the hell.",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Today",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: true,
      isActive: false,
      messageCount: "1"
    ),
    ChatList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Baby",
        contentMessage: "Ahhh how cute? ><.",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "24/09/2024",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: false,
      isActive: true,
        messageCount: "2"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: itemList.map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailScreen(
                        item: e,
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: e.hasStory == true
                                      ? Colors.blue
                                      : Colors
                                          .transparent,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  e.imgSrc ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            // Green active point

                            if (e.isActive == true)
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.title ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                e.contentMessage ?? "",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(e.statusTime ?? ""),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 30,
                              height: 27,
                              decoration: BoxDecoration(
                                color: Color(0x919089FC),
                                // shape: BoxShape.circle,
                                // border: Border.all(
                                //   color: Colors.white,
                                //   width: 2,
                                // ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(
                                child: Text(e.messageCount ?? ""),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Divider(height: 1, color: Color(0x267D7D7D)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ChatList {
  final Color? bgColor;
  final Color? color;
  final String? title;
  final String? contentMessage;
  final IconData? icon;
  final String? statusTime;
  final String? imgSrc;
  final bool? hasStory;
  final bool? isActive;
  final String? messageCount;

  ChatList({
    this.bgColor,
    this.color,
    this.title,
    this.contentMessage,
    this.icon,
    this.statusTime,
    this.imgSrc,
    this.hasStory,
    this.isActive,
    this.messageCount
  });
}
