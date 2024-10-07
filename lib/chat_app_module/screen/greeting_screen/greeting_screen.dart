import 'package:chat_app/chat_app_module/screen/verification_screen/phone_verification.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../theme/helpers/language_helper.dart';
import '../../config/config.dart';
class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        children:[ 
          SizedBox(height: 135.h,),
          Container(
          width: double.infinity,
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 62.w),
            child: Column(
             children: [
               Container(
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.transparent, // Border color
                     width: 4.0,         // Border width
                   ),
                   borderRadius: BorderRadius.circular(8.0), // Optional: Rounded corners
                 ),
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(8.0), // Same as container's borderRadius if rounded
                   child:  Image.asset("asset/image/Illustration.png",
                     width: 262.w,
                     height: 271.h,
                   ),

                   ),
                 ),


               SizedBox(height: 20,),
               Text(lang.greeting
               ,
            textAlign: TextAlign.center,
                 style: AppTheme.largeFontTextStyle(context),

               ),
               SizedBox(height: 90.h,),
               Text(lang.term,
               style:AppTheme.smallFontTextStyle(context),
               ),
               SizedBox(height: 20.h,),
               Container(
                 width: 327.w,
                 height: 52.h,
                 decoration: BoxDecoration(
                   // color: Colors.red
                 ),

                 child: ElevatedButton(
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
                     fixedSize: Size(327.w, 52.h),
                    //  minimumSize: Size(double.infinity, 60.sp),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20.sp), // Border radius
                     ),
                     // elevation: 5,  // Shadow/elevation
                   ),
                   child: Text(lang.startButton,
                     style: AppTheme.mediumTextStyleButton,
                   )
                 ),
               )
        
             ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
