import 'package:chat_app/chat_app_module/config/config.dart';
import 'package:chat_app/chat_app_module/screen/setup_profile_screen/setup_profile_screen.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../theme/helpers/language_helper.dart';
class CodeVerificationScreen extends StatelessWidget {

  const CodeVerificationScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color:  AppTheme.textFieldColor(context), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppTheme.textFieldColor(context)),
      borderRadius: BorderRadius.circular(8),
    );

    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    return Scaffold(

      appBar: AppBar(),
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h, right: 20.w, bottom: 20.h, left: 20.w),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lang.enterCodeTitle,
                style: AppTheme.largeFontTextStyle(context)
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                lang.enterCodeSubTitle,
                textAlign: TextAlign.center,
                style: AppTheme.smallFontTextStyle(context)
              ),
              SizedBox(
                height: 50.h,
              ),
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.grey)
                )
              ),
            ),
              SizedBox( height: 40,),
            TextButton(onPressed: (){},
                child: Text(lang.resendCode,
                style: TextStyle(
                  fontSize: 18.sp
                ),
                )
            ),
              SizedBox( height: 10,),
              // Text("Selected Country Code: $selectedCountryCode"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetupProfileScreen(), // Replace with your screen widget
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(

                  // onPrimary: Colors.white,
                  backgroundColor: Color(0xFF214BF3),
                  // minimumSize: Size(double.infinity, 60), // Button size
                  fixedSize: Size(327.w, 52.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.sp), // Border radius
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
