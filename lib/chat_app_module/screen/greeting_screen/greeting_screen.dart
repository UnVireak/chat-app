import 'package:chat_app/chat_app_module/screen/verification_screen/phone_verification.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/helpers/language_helper.dart';
class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 170, right: 20, bottom: 20,
           left: 20),
          child: Column(
           children: [
             Image.asset("asset/image/Illustration.png"),
             SizedBox(height: 20,),
             Text(lang.greeting
             ,
          textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold, ),

             ),
             SizedBox(height: 120,),
             Text(lang.term),
             SizedBox(height: 20,),
             ElevatedButton(
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => PhoneVerification(), // Replace with your screen widget
                   ),
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
               child: Text(lang.startButton,
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
