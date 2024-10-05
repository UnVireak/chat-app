import 'package:chat_app/chat_app_module/screen/chat_screen/chat_screen.dart';
import 'package:chat_app/chat_app_module/screen/contact_screen/contact_screen.dart';
import 'package:chat_app/chat_app_module/screen/more_screen/more_screen.dart';
import 'package:chat_app/chat_app_module/theme/helpers/language_helper.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    return Scaffold(
      // backgroundColor: Color(0x1AE6E6E6),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children:[

          Center(child: ContactScreen()),
          Center(child: ChatScreen()),
          Center(child: MoreScreen(),),

        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color(0xFF1E1E1E) // Dark mode background color
            : Colors.white, // Light mode background color,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          controller.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        iconSize: 25,
        // activeColor: Color(0xFF01579B),
        activeColor:  Theme.of(context).brightness == Brightness.dark
            ? Colors.white// Dark mode background color
            : Colors.black54, // Light mode background color,,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: FontAwesomeIcons.userGroup,
            title: lang.contactScreenTitle,
          ),
          BarItem(
            icon: FontAwesomeIcons.comment,
            title: lang.chatTitle,
          ),
          BarItem(
            icon: FontAwesomeIcons.ellipsis,
            title: lang.moreScreenTitle,
          ),
        ],
      ),
    );
  }
}
