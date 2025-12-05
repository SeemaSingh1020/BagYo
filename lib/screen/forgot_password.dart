import 'package:flutter/material.dart';
import '../config/palette.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  bool showPassword1 = false;
  bool showPassword2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          // Header Image
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/img1.png"),
                    fit: BoxFit.fill),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                color: const Color(0xFF3b5999).withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome to ",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Palette.yellow,
                        ),
                        children: [
                          TextSpan(
                            text: " BagYo",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Palette.yellow,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Continue Reset Password",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Palette.backgroundColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // Main Box
          Positioned(
            top: 220,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Palette.backgroundColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Palette.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Palette.activeColor,
                      letterSpacing: 2,
                    ),
                  ),
                  const Text(
                    "Enter your email to receive an OTP",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Palette.textColor1,
                    ),
                  ),

                  const SizedBox(height: 10),
                  buildSignupSection(),

                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "We will send you an OTP to your registered\nemail address to enable you to login",
                        style: TextStyle(color: Palette.textColor2),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),
                ],
              ),
            ),
          ),

          // Button Shadow
          buildBottomButtonShadow(),

          // Submit Button
          buildSubmitButton(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => OtpScreen()),
            );
          }),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(Icons.email, "info@bagyo.com", false, true,
              isFirstPassword: false),

          buildTextField(Icons.lock, "enter password", true, false,
              isFirstPassword: true),

          buildTextField(Icons.lock, "new password", true, false,
              isFirstPassword: false),
        ],
      ),
    );
  }

  Widget buildTextField(
      IconData icon,
      String hintText,
      bool isPassword,
      bool isEmail,
      {required bool isFirstPassword}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword
            ? (isFirstPassword ? !showPassword1 : !showPassword2)
            : false,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Palette.iconColor),

          // 👁 Show / Hide Eye Icon
          suffixIcon: isPassword
              ? GestureDetector(
            onTap: () {
              setState(() {
                if (isFirstPassword) {
                  showPassword1 = !showPassword1;
                } else {
                  showPassword2 = !showPassword2;
                }
              });
            },
            child: Icon(
              (isFirstPassword ? showPassword1 : showPassword2)
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Palette.iconColor,
            ),
          )
              : null,

          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }

  Widget buildBottomButtonShadow() {
    return Positioned(
      top: 565,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: Palette.backgroundColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Palette.black.withOpacity(.3),
                spreadRadius: 1.5,
                blurRadius: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubmitButton(VoidCallback onTap) {
    return Positioned(
      top: 565,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 90,
            width: 90,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Palette.backgroundColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Palette.orange, Palette.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Palette.black.withOpacity(.3),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1))
                ],
              ),
              child: const Icon(Icons.arrow_forward,
                  color: Palette.backgroundColor),
            ),
          ),
        ),
      ),
    );
  }
}
