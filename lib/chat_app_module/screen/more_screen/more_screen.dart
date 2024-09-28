import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final List<Map<String, dynamic>> settingsItems = [
    {'icon': FontAwesomeIcons.user, 'title': 'Account'},
    {'icon': FontAwesomeIcons.comments, 'title': 'Chats'},
    {'icon': FontAwesomeIcons.sun, 'title': 'Appearance'},
    {'icon': FontAwesomeIcons.bell, 'title': 'Notification'},
    {'icon': FontAwesomeIcons.shieldAlt, 'title': 'Privacy'},
    {'icon': FontAwesomeIcons.folderOpen, 'title': 'Data Usage'},
    {'icon': FontAwesomeIcons.questionCircle, 'title': 'Help'},
    {'icon': FontAwesomeIcons.envelope, 'title': 'Invite Your Friends'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x1AE6E6E6),
        // titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "More",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),



            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F6F7),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.userLarge,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "useremail@example.com",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: FaIcon(FontAwesomeIcons.chevronRight),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: settingsItems.length,
            itemBuilder: (context, index) {
              final item = settingsItems[index];
              return Column(
                children: [
                  ListTile(
                    leading: FaIcon(item['icon']),
                    title: Text(item['title']),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {

                    },
                  ),
                  Divider(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}


