import 'package:chat_app/chat_app_module/screen/contact_screen/contact_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ContactScreen> {
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
                "Contacts",
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
           backgroundColor: Color(0x1AE6E6E6),
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
                      color: Color(0x91E0E0E8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
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
