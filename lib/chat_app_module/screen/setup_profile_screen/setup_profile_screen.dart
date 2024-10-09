// import 'dart:js';

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
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../config/image_picker.dart';
import '../../theme/helpers/language_helper.dart';
class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  final String _imageKey = 'profile_image';
XFile? xFile;
  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  // Method to load the saved image path from shared preferences
  void _loadSavedImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString(_imageKey);
    if (imagePath != null) {
      setState(() {
        xFile = XFile(imagePath);
      });
    }
  }

  // Method to save the selected image path to shared preferences
  void _saveImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageKey, path);
  }

  // Method to update the image from the camera or gallery
  void updateImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        xFile = pickedFile;
      });
      _saveImage(pickedFile.path); // Save the selected image path
    }
  }

  void  _clearImg() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('profile_image'); // Clear the image path
  }

  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;

    

    // void updateImage(ImageSource source) async {
    //   final XFile? pickedFile = await browseImage(source);
    //   if (pickedFile != null) {
    //     setState(() {
    //       xFile = pickedFile;
    //     });
    //   }
    // }

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
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(100),
                    image: xFile != null
                        ? DecorationImage(
                            image: FileImage(File(xFile!.path)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: xFile == null
                      ? Center(
                          child: FaIcon(
                            FontAwesomeIcons.userLarge,
                            size: 60,
                            color: Colors.grey,
                          ),
                        )
                      : null,
                ),


                Positioned(
                  top: 80,
                  left: 80,

                  child: Container(
                    width: 10,
                    height: 10,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black54
                    ),
                    
                    child: IconButton(
                      onPressed: () {
                        updateImage(ImageSource.camera);
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.circlePlus,

                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black54,
                        size: 25,
                      ),
                      padding: EdgeInsets.zero, // Keeps the button size minimal
                      constraints: BoxConstraints(
                        minWidth: 40, // Ensure touchable area
                        minHeight: 40,
                      ),
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
                      (Route<dynamic> route) => false, 
                      
                );
                // _clearImg();
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
