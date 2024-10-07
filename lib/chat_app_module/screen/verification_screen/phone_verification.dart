import 'package:chat_app/chat_app_module/config/config.dart';
import 'package:chat_app/chat_app_module/screen/verification_screen/code_verification_screen.dart';
import 'package:chat_app/chat_app_module/theme/logics/cache_theme_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/helpers/language_helper.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String selectedCountryCode = '+1';

  @override
  Widget build(BuildContext context) {
    CacheLanguage lang = context.watch<CacheThemeLogic>().cacheLang;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 20, bottom: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(lang.enterPhoneNumerTitle,
                  style: AppTheme.largeFontTextStyle(context)),
              SizedBox(
                height: 10,
              ),
              Text(lang.confirmPhoneNumer,
                  textAlign: TextAlign.center,
                  style: AppTheme.smallFontTextStyle(context)),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 60,
                    width: 135,
                    decoration: BoxDecoration(
                        color: AppTheme.bgTextFieldColor(context),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      // margin: EdgeInsets.only(left: 0),
                      child: CountryCodePicker(

                        onChanged: (countryCode) {
                          setState(() {
                            selectedCountryCode = countryCode.dialCode!;
                          });
                          print('Selected Country: ${countryCode.name}');
                          print('Selected Code: ${countryCode.dialCode}');
                        },

                        initialSelection: 'US',
                        favorite: ['+1', 'US'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        flagWidth: 30,
                        textStyle: TextStyle(
                          fontSize: 14, // Set custom text size
                          fontWeight: FontWeight.w500, // Set custom font weight
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white // Dark mode background color
                              : Colors.black, // Set custom text color
                        ),
                        // dialogTextStyle: TextStyle(
                        //   color: Theme.of(context).brightness == Brightness.dark
                        //       ? Colors.white // Dark mode background color
                        //       : Colors.black54, // Light mode background color,,
                        // ),
                        dialogBackgroundColor: Theme.of(context).brightness ==
                                Brightness.dark
                            ? Colors.black54 // Dark mode background color
                            : Colors.white, // Light mode background color,
                        // flagDecoration: BoxDecoration(
                        //   color: Theme.of(context).brightness == Brightness.dark
                        //       ? Colors.black54 // Dark mode background color
                        //       : Colors.white, // Light mode background color,,
                        // ),
                      ),
                      // You can add more properties as per your need
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppTheme.bgTextFieldColor(context),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: TextField(
                          style: TextStyle(
                              color: AppTheme.textFieldColor(context)),
                          keyboardType:
                              TextInputType.number, // Number keyboard only
                          decoration: InputDecoration(
                            border: InputBorder
                                .none, // Removes the underline (border)
                            hintText: lang
                                .phoneNumberPlaceHolder, // Optional: Add a hint if needed
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),

              // Text("Selected Country Code: $selectedCountryCode"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CodeVerificationScreen(), // Replace with your screen widget
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
