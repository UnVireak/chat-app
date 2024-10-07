import 'package:chat_app/chat_app_module/config/config.dart';
import 'package:chat_app/chat_app_module/screen/contact_screen/contact_list_widget.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../theme/helpers/language_helper.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ContactScreen> {
  bool _stretch = true;
  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Define button colors based on the theme
    Color buttonColor = isDarkMode ? Colors.grey[800]! : Colors.blue;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Color(0x1AE6E6E6),
        // titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lang.contactScreenTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.plus, size: 18,),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            stretch: true,
            stretchTriggerOffset: 300.0,
           // backgroundColor: Color(0x1AE6E6E6),
            onStretchTrigger: () async {
              // Triggers when stretching
            },
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(

                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      // color: Color(0x91E0E0E8),
                      color: AppTheme.bgTextFieldColor(context),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: lang.contactSearchBox,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
             child: ContactListWidget(),
          )

        ],
        ),
      ),
    );
  }
}
