import 'package:chat_app/chat_app_module/config/config.dart';
import 'package:chat_app/chat_app_module/screen/main_screen/main_screen.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../config/image_picker.dart';
import '../../theme/helpers/language_helper.dart';
class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;

    XFile? xFile;

    void updateImage(ImageSource source) async {
      final XFile? pickedFile = await browseImage(source);
      if (pickedFile != null) {
        setState(() {
          xFile = pickedFile;
        });
      }
    }

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
                    color: AppTheme.bgTextFieldColor(context),
                    borderRadius: BorderRadius.circular(100),
                    image: xFile != null
                        ? DecorationImage(
                      image: FileImage(File(xFile!.path)),
                      fit: BoxFit.cover,
                    )
                        : null, // Only set the image if xFile is not null
                  ),
                  child: xFile == null
                      ? Center(
                    child: FaIcon(
                      FontAwesomeIcons.userLarge,
                      size: 60,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                      : null, // No child if there is an image
                ),



                Positioned(
                  top: 80,
                  left: 80,
                  child: IconButton(
                    onPressed: () {
                      updateImage(ImageSource.camera);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.circlePlus,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      size: 25,
                    ),
                    padding: EdgeInsets.zero, // Keeps the button size minimal
                    constraints: BoxConstraints(
                      minWidth: 40, // Ensure touchable area
                      minHeight: 40,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.h,),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.bgTextFieldColor(context),
                    borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: lang.firstNamePlaceHolder,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppTheme.bgTextFieldColor(context),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: lang.lastNamePlaceHolder,
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
                // minimumSize: Size(double.infinity, 60), // Button size
                fixedSize: Size(327.w, 52.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Border radius
                ),
                // elevation: 5,  // Shadow/elevation
              ),
              child: Text(lang.continueBtn,
                style: AppTheme.mediumTextStyleButton),
            )
          ],
        ),
        ),
      ),
    );
  }
}
