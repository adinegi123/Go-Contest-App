import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_contest_flutter/utils/image.dart';
import 'package:go_contest_flutter/views/HomePage/home_page.dart';
import 'package:go_contest_flutter/views/onboarding%20screen/onboard%20view/onboard_view_new.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../widgets/bottom_navigation_widget.dart';
import '../../widgets/elevated button.dart';
import '../onboard_test.dart';
import '../onboard_test_two.dart';

class OtpAfterWelcomeScreenPage extends StatefulWidget {
  const OtpAfterWelcomeScreenPage({Key? key}) : super(key: key);

  @override
  State<OtpAfterWelcomeScreenPage> createState() =>
      _OtpAfterWelcomeScreenPageState();
}

class _OtpAfterWelcomeScreenPageState extends State<OtpAfterWelcomeScreenPage> {
  OtpFieldController otpFieldController = OtpFieldController();
  var otp = "";
  int start = 59;
  bool wait = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  AppConstant.background,
                  fit: BoxFit.cover,
                )),
            Positioned(
              top: 3,
              left: 1,
              right: 1,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    SizedBox(height: 130, child: Image.asset(AppConstant.logo)),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 30.sp),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter 4 digit OTP sent to 9069733061",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                    // InkWell(
                    //     onTap: () {
                    //       // Navigator.push(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //         builder: (_) => CreateNewPasswordPage()));
                    //       if (otpFieldController == null) {
                    //         print('please fill otp');
                    //       }
                    //     },
                    //     child: TextButton(
                    //       onPressed: () {},
                    //       child: Text(''),
                    //     )),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: otpField(),
                    ),
                    SizedBox(
                      height: 30.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Resend otp in',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.sp),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          start != 0
                              ? Text(
                                  '00:$start',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                )
                              : Text(
                                  '00:$start',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15.sp),
                                ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'sec',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: 140,
                      child: MyElevatedButton(
                        label: 'Continue',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => BottomNavigationWidget()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget otpField() {
    return OTPTextField(
      length: 4,
      fieldStyle: FieldStyle.box,
      controller: otpFieldController,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 58,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white,
        borderColor: Colors.white,
      ),
      style: TextStyle(fontSize: 17, color: Colors.black),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      // fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        print('************************************');
        if (pin == otp) {
          // getOtpVerification(user_id, pin);
          // pincode = pin;
        } else {
          print('wrong otp');
        }
      },
      onChanged: (pin) {
        print("changed: " + pin);
      },
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }
}
