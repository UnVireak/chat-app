import 'package:chat_app/chat_app_module/screen/verification_screen/code_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String selectedCountryCode = '+1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 20, bottom: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter Your Phone Number",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please confirm your country code and enter \nyour phone number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
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
                        color: Color(0x6BE8EDFF),
                      borderRadius: BorderRadius.circular(10)
                    
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 0),
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
                        flagWidth:30,
                        textStyle: TextStyle(
                          fontSize: 14, // Set custom text size
                          fontWeight: FontWeight.w500, // Set custom font weight
                          color: Color(0xDB7B7C7F), // Set custom text color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0x6BE8EDFF),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                       child: TextField(
                         keyboardType: TextInputType.number, // Number keyboard only
                         decoration: InputDecoration(
                           border: InputBorder.none, // Removes the underline (border)
                           hintText: 'Enter number', // Optional: Add a hint if needed
                         ),
                       ),

                      ),
                    ),
                  ),
                ],
              ),
              SizedBox( height: 60,),

              // Text("Selected Country Code: $selectedCountryCode"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CodeVerificationScreen(), // Replace with your screen widget
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
