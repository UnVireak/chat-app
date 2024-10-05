import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:chat_app/chat_app_module/theme/switch_language_screen.dart';
import 'package:chat_app/chat_app_module/theme/switch_theme_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/helpers/language_helper.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {


  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    final List<Map<String, dynamic>> settingsItems = [
      {'icon': FontAwesomeIcons.user, 'title': lang.account},
      {'icon': FontAwesomeIcons.sun, 'title': lang.darkMode},
      {'icon': FontAwesomeIcons.globe, 'title': lang.language},
      {'icon': FontAwesomeIcons.bell, 'title': lang.notification},
      {'icon': FontAwesomeIcons.shieldAlt, 'title': lang.privacy},
      {'icon': FontAwesomeIcons.folderOpen, 'title': lang.privacy},
      {'icon': FontAwesomeIcons.questionCircle, 'title': lang.help},
      {'icon': FontAwesomeIcons.envelope, 'title': lang.inviteFriend},
    ];
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0x1AE6E6E6),
        // titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(lang.moreScreenTitle)
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10,top: 20, right: 0),
        children: [
          Padding(
            padding: EdgeInsets.only(right:22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: FaIcon(FontAwesomeIcons.chevronRight, size: 20, color: Colors.grey,),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: settingsItems.length, // The list of items
            itemBuilder: (context, index) {
              final item = settingsItems[index];
              return Column(
                children: [
                  ListTile(
                    leading: FaIcon(item['icon']), // Leading icon
                    title: Text(item['title']),    // Title text
                    trailing: FaIcon(FontAwesomeIcons.chevronRight,  size: 20, color: Colors.grey,), // Trailing icon
                    onTap: () {
                      // Perform navigation when the row is tapped
                      switch (index) {
                        case 0:
                        // Navigate to the first screen

                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DarkModeSelectionScreen(), // Replace with your screen widget
                            ),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LanguageChangeScreen(), // Replace with your screen widget
                            ),
                          );
                          break;
                        default:
                        // Handle other cases
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => DefaultScreen(), // Replace with default screen
                        //     ),
                        //   );
                      }
                    },
                  ),
                  Divider(),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}


