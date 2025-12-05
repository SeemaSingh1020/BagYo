import 'package:flutter/material.dart';
import '../config/palette.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
  List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/img1.png"),
                  fit: BoxFit.fill,
                ),
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
                          ]),
                    ),
                    const SizedBox(height: 5),
                    Text( "Continue Reset Password",
                      style: const TextStyle(
                        letterSpacing: 1,
                        color: Palette.backgroundColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

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
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Palette.activeColor,
                      letterSpacing: 2,
                    ),
                  ),
                  const Text(
                    "Enter the 4-digit OTP sent to your email",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Palette.textColor1,
                    ),
                  ),

                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return otpBox(index);
                    }),
                  ),

                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Haven’t got the email yet? ",
                        style: TextStyle(fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Resend email action
                        },
                        child: const Text(
                          "Resend email",
                          style: TextStyle(
                            color: Palette.facebookColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                ],
              ),
            ),
          ),

          buildBottomButtonShadow(),

          buildSubmitButton(() {
            String otp = _controllers.map((c) => c.text).join();
            debugPrint("OTP ENTERED: $otp");
          }),

        ],
      ),
    );
  }

  //  OTP BOX WIDGET
  Widget otpBox(int index) {
    return Container(
      width: 55,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: _focusNodes[index].hasFocus || _controllers[index].text.isNotEmpty
              ? Palette.facebookColor
              : Palette.textColor1,
        ),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Palette.black,
        ),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
          setState(() {});
        },
      ),
    );
  }

  Widget buildBottomButtonShadow() {
    return Positioned(
      top: 470,
      left: 0,
      right: 0,
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
      top: 470,
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
              ),
              child: const Icon(
                Icons.check,
                color: Palette.backgroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

