import 'package:chat_app/chat_app_module/screen/main_screen/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Padding(
        padding: EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F6F7),
                    borderRadius: BorderRadius.circular(100),
                  ),
                 child: Center(
                   child: FaIcon(FontAwesomeIcons.userLarge, size: 60,),
                 ),
                ),
                Positioned(
                  top: 90,
                  left: 90,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: FaIcon(
                          FontAwesomeIcons.circlePlus,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF2F6F7),
                    borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'First Name (Required)',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFF2F6F7),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Last Name (Required',
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                      (Route<dynamic> route) => false, // Remove all previous routes
                );
              },
              style: ElevatedButton.styleFrom(

                // onPrimary: Colors.white,
                backgroundColor: Color(0xFF214BF3),
                minimumSize: Size(double.infinity, 60), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Border radius
                ),
                // elevation: 5,  // Shadow/elevation
              ),
              child: Text('Continue',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white
                ),),
            )
          ],

        ),
        ),
      ),
    );
  }
}
