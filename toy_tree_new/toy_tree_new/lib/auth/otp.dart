import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pinput/pinput.dart';
import 'package:toy_tree_new/addresh/location.dart';
import 'package:toy_tree_new/auth/ragition.dart';
import 'package:toy_tree_new/firebase.dart';
import 'package:toy_tree_new/home/home.dart';
import 'package:toy_tree_new/provider/auth_provider.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String? verificationId;
  final String? number;
  const OtpScreen({super.key,  this.verificationId,this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  String? otpCode;
  firebaseconst pref = firebaseconst();
  @override
  Widget build(BuildContext context) {
   /* final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;*/
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP verification",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        leading: IconButton(
          onPressed: (){
           // Get.to(RegisterScreen());
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const RegisterScreen()),
            );
           // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RegisterScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child:  Center(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: Column(
              children: [
                const Text(
                  "we've sent a verification code to",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Pinput(
                  controller: otpController,
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                      print(otpController);
                    });
                  },
                ),
                const SizedBox(height: 25),
               /* SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: CustomButton(
                    text: "Verify",
                    onPressed: () {
                      if (otpCode != null) {
                        verifyOtp(context, otpCode!);
                      } else {
                        showSnackBar(context, "Enter 6-Digit code");
                      }
                    },
                  ),
                ),*/

                const SizedBox(height: 15),
                const Text(
                  "Resend OTP in 25",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: otpController.length == 6 ? GestureDetector(
        onTap: () async {
          print("${otpController.text} --- == --- ${verificatiId}" );
         final data = await pref.verifyOTP(otpController.text,verificatiId);
          print("OTP Output :: $data");
          if(data != "Invalid OTP"){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) =>
                  LocationScreen(
                    number: widget.number,
                  )),
            );

          }else {
            // verifyOtp(context,otpController.text);
            Fluttertoast.showToast(
                msg: data,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12
          ),
          height: 50,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('NEXT')]
          ),
        ),
      ) : SizedBox(),
    );
  }
}
