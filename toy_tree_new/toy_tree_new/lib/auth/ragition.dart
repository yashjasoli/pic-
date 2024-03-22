import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toy_tree_new/auth/onboading.dart';
import 'package:toy_tree_new/auth/otp.dart';
import 'package:toy_tree_new/home/home.dart';
import 'package:toy_tree_new/home/home_screen.dart';
import 'package:toy_tree_new/provider/auth_provider.dart';
import 'package:toy_tree_new/utility/consts/colors.dart';
import 'package:toy_tree_new/firebase.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  firebaseconst pref = firebaseconst();
  bool isLoggedIn = false;
  bool otpSent = false;
  late String uid;
  late String _verificationId;
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            // Get.to(RegisterScreen());
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const OnboardingScreen()),
            );
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RegisterScreen()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            child: Column(
              children: [
                Text(
                  'Enter Phone number for verification',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                Text(
                  'This number will be used for all order related communication. you shall receive an SMS with code for verification.',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                 // cursorColor: Colors.purple,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    counterText: "",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),

                    prefixIcon: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 550,
                              ),
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: phoneController.text.length > 9
                        ? Container(
                            height: 30,
                            width: 30,
                            margin: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                /* SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                      text: "Login", onPressed: () => sendPhoneNumber()),
                ),*/
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: phoneController.text.length > 9 ? GestureDetector(
        onTap: () async{
        //  sendPhoneNumber();
          final data  = await pref.sendOTP(phoneController.text);

          print("data data ::: $data");
          if(data == true){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) =>  OtpScreen(number: phoneController.text,)),
          );
        }
          },
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
            children: [Text('NEXT')],
          ),
        ),
      ) : null,
    );
  }

 /* void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }*/

  void _sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + phoneController.text,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
   /* setState(() {
      otpSent = true;
    });*/
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) =>  OtpScreen(number: phoneController.text,)),
    );
    print("otp send");
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    setState(() {
      _verificationId = verificationId;
      otpSent = true;
    });
  }

  // ignore: avoid_types_as_parameter_names
  void codeSent(String verificationId, [int ]) {
    setState(() {
      _verificationId = verificationId;
      otpSent = true;
      print("send otp"+verificationId.toString());
    });
  }

  void verificationFailed(FirebaseAuthException exception) {
    print("Failed to sign In${exception.message}");
    setState(() {
      isLoggedIn = false;
      otpSent = false;
    });
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        isLoggedIn = true;
        uid = FirebaseAuth.instance.currentUser!.uid;
      });
    } else {
      print("Failed to sign In");
    }
  }

}
