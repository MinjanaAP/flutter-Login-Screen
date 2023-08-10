import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:email_validator/email_validator.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordToggle = true;
  
  

  void validateEmail(){
    final bool isValid = EmailValidator.validate(emailController.text.trim());
    debugPrint("${emailController.text.trim()} ");
    if(!isValid){
      ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("Please Enter a Valid Email")));
    }
  } 

  void validatePassword(){
    debugPrint("${passwordController.text.trim()} ");
    if(passwordController.text.trim().isEmpty){
      ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("Please Enter a Valid Password")));
    }

  }

  void clearText(){
    emailController.clear();
    passwordController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/128/2718/2718224.png",
              height: 127,
              width: 127,
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text(
              "HUNGRY",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: "Istok Web",
                color: Color(0xffF04B37),
              ),
            ),
          ),
          const Center(
            child: Text(
              "BUSTERS",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: "Istok Web",
                color: Color(0xffF04B37),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 40, 0, 0),
            child: Text(
              "email",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Istok Web",
                color: Color(0xffF04B37),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xff3F0B04),
                  width: 1,
                ),
              ),
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "jimmy@habmail.com",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xff917572),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
            
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              "password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Istok Web",
                color: Color(0xffF04B37),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xff3F0B04),
                  width: 1,
                ),
              ),
            ),
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "*********",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xff917572),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: TextButton(
                  onPressed: () {
                    
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Istok Web",
                      color: Color(0xff917572),
                    ),
                  ),
                )),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: MaterialButton(
                    color: const Color(0xffF04B37),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    onPressed: () {
                      validateEmail();
                      validatePassword();
                      clearText();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Istok Web",
                          color: Color(0xffF0EDEC),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Center(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
              child: Text(
                "or",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Istok Web",
                  color: Color(0xff917572),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  "lib/icons/google.svg",
                  height: 29,
                  width: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  "lib/icons/facebook.svg",
                  height: 29,
                  width: 28,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                  fontFamily: "Istok Web",
                  color: Color(0xffF04B37),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                    fontFamily: "Istok Web",
                    color: Color(0xffF04B37),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    )));
  }
}
