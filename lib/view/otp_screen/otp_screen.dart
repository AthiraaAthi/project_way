import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/home_screen/home_screen.dart';
import 'package:project_way/view/screen/responsive.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorConstant.defIndigo),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.white,
      ),
    );
    //for tab
    final defaultTabPinTheme = PinTheme(
      width: 76,
      height: 76,
      textStyle: TextStyle(
          fontSize: 30,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    final focusedTabPinTheme = defaultTabPinTheme.copyDecorationWith(
      border: Border.all(color: ColorConstant.defIndigo),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedTabPinTheme = defaultTabPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.white,
      ),
    );
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.bgBlue,
          body: ResponsiveWidget(
            mobile: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'otpscreen.otpVerification'.tr(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'otpscreen.otpInstruction'.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'otpscreen.phoneNumber'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Pinput(
                    separatorBuilder: (index) {
                      return SizedBox(
                        width: 20,
                      );
                    },
                    length: 4,
                    controller: pinController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinAnimationType: PinAnimationType.fade,
                    onCompleted: (pin) {},
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                    child: Container(
                      height: 65,
                      width: 320,
                      decoration: BoxDecoration(
                        color: ColorConstant.defIndigo,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'otpscreen.verifyButton'.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'otpscreen.resendInstruction'.tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'otpscreen.resendButton'.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.indigo),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //FOR TAB
            tab: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'otpscreen.otpVerification'.tr(),
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'otpscreen.otpInstruction'.tr(),
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                  ),
                  Text(
                    "+91 889xxxxxx90",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Pinput(
                    separatorBuilder: (index) {
                      return SizedBox(
                        width: 50,
                      );
                    },
                    length: 4,
                    controller: pinController,
                    defaultPinTheme: defaultTabPinTheme,
                    focusedPinTheme: focusedTabPinTheme,
                    submittedPinTheme: submittedTabPinTheme,
                    pinAnimationType: PinAnimationType.fade,
                    onCompleted: (pin) {},
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                    child: Container(
                      height: 80,
                      width: 380,
                      decoration: BoxDecoration(
                        color: ColorConstant.defIndigo,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Verify",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't get the OTP ? ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Resend",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                              color: Colors.indigo),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
