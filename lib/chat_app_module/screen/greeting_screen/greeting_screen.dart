import 'package:flutter/material.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 170, right: 20, bottom: 20,
           left: 20),
          child: Column(
           children: [
             Image.asset("asset/image/Illustration.png"),
             SizedBox(height: 20,),
             Text("Connect easily with \nyour family and friends \nover countries"
             ,textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold, ),

             ),
             SizedBox(height: 120,),
             Text("Terms & Privacy Policy"),
             SizedBox(height: 20,),
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
               child: Text('Start messaging',
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
