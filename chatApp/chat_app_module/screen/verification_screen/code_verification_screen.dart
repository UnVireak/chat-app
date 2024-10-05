import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
class CodeVerificationScreen extends StatelessWidget {

  const CodeVerificationScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );
    return Scaffold(
        body: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 170, right: 20, bottom: 20, left: 20),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter code",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We have sent you a SMS with the code \nto +855 11 466 648",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: 50,
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
                child: Text("Resend code",
                style: TextStyle(
                  fontSize: 18
                ),
                )
            ),
              SizedBox( height: 10,),
              // Text("Selected Country Code: $selectedCountryCode"),
              ElevatedButton(
                onPressed: () {},
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
