import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StoryListWidget extends StatefulWidget {
  @override
  _StoryListWidgetState createState() => _StoryListWidgetState();
}

class _StoryListWidgetState extends State<StoryListWidget> {
  List<StoryList> itemList = [
    StoryList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Last seen 3 hours ago",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: true,
      isActive: false,
    ),
    StoryList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Freelance work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Online",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: false,
      isActive: true,
    ),
    StoryList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Freelance work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Last seen 3 hours ago",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: true,
      isActive: false,
    ),
    StoryList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Freelance work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Online",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: false,
      isActive: true,
    ),
    StoryList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Freelance work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Last seen 3 hours ago",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: true,
      isActive: false,
    ),
    StoryList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Freelance work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Online",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: false,
      isActive: true,
    ),
    StoryList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Freelance work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Last seen 3 hours ago",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: true,
      isActive: false,
    ),
    StoryList(
      bgColor: Color(0x960200F0),
      color: Color(0xFFFFFFFF),
      title: "Freelance work",
      icon: FontAwesomeIcons.briefcase,
      statusTime: "Online",
      imgSrc:
          "https://assets.capitalfm.com/2020/17/paul-mescal-normal-people-1588088181-view-1.png",
      hasStory: false,
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 22),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                          ? Color(0xFF152032) // Dark mode background color
                          : Color(0xFFF7F7FC), // Light mode background color,,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: FaIcon(FontAwesomeIcons.plus, color: Colors.grey,),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 60, // Set width to restrict the space for the text
                  height: 20,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text(
                      "Your story",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: itemList.map((e) {
              return Padding(
                padding:
                    EdgeInsets.only(left: 0, right: 20, top: 10, bottom: 10),
                child: InkWell(
                  onDoubleTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              // child: Image.network(
                              //   e.imgSrc ?? "",
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: e.hasStory == true
                                    ? Colors.blue
                                    : Colors.grey,
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
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 60,
                        height: 20,
                        child: Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Text(
                            "${e.title}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class StoryList {
  final Color? bgColor;
  final Color? color;
  final String? title;
  final IconData? icon;
  final String? statusTime;
  final String? imgSrc;
  final bool? hasStory;
  final bool? isActive;

  StoryList({
    this.bgColor,
    this.color,
    this.title,
    this.icon,
    this.statusTime,
    this.imgSrc,
    this.hasStory,
    this.isActive,
  });
}
