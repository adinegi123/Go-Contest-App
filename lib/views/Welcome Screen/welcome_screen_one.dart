import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_contest_flutter/utils/image.dart';
import 'package:go_contest_flutter/views/Privacy%20Policy/privacy_policy.dart';
import 'package:go_contest_flutter/views/Terms%20and%20Conditions/terms_and_conditions.dart';
import 'package:go_contest_flutter/views/Welcome%20Screen/otp_after_welcome_screen.dart';
import 'package:go_contest_flutter/views/Welcome%20Screen/welcome_screen_with_referral.dart';

import '../../widgets/TextFormField.dart';
import '../../widgets/elevated button.dart';

class WelcomeScreenOne extends StatefulWidget {
  const WelcomeScreenOne({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenOne> createState() => _WelcomeScreenOneState();
}

class _WelcomeScreenOneState extends State<WelcomeScreenOne> {
  bool checkboxValue = false;
  bool isChecked = false;
  bool isReferralClicked = false;
  TextEditingController _referralCodeController = TextEditingController();
  TextEditingController phone_no_controller = TextEditingController();

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
                  'assets/images/bg2.png',
                  fit: BoxFit.cover,
                )),
            Positioned(
                top: 1,
                left: 1,
                right: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        SizedBox(
                            height: 130, child: Image.asset(AppConstant.logo)),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 30.sp),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: MyTextFormField(
                              hintText: 'Enter Mobile Number',
                              keyboardType: TextInputType.number,
                              controller: phone_no_controller,
                              maxLines: 1,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone number should not be empty';
                                } else if (!RegExp(
                                        r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                    .hasMatch(value)) {
                                  return 'Please enter valid mobile number';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Visibility(
                          replacement: Container(),
                          visible: isReferralClicked,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: MyTextFormField(
                                hintText: 'Enter Referral Code',
                                keyboardType: TextInputType.number,
                                controller: _referralCodeController,
                                maxLines: 1,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'referral code should not be empty';
                                  } else {
                                    return null;
                                  }
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) =>
                            //             WelcomeScreenWithReferral()));
                            setState(() {
                              isReferralClicked = true;
                            });
                          },
                          child: Text(
                            "Have a Referral Code?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(
                        //       horizontal: 10, vertical: 25),
                        //   height: 40,
                        //   padding: EdgeInsets.symmetric(horizontal: 10),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //     color: Colors.blueAccent,
                        //   ),
                        //   child: TextButton(
                        //       onPressed: () {
                        //         Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (_) =>
                        //                     OtpAfterWelcomeScreenPage()));
                        //       },
                        //       child: Text(
                        //         "Continue",
                        //         style: const TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 15,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       )),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                          width: 140,
                          child: MyElevatedButton(
                            label: 'Continue',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          OtpAfterWelcomeScreenPage()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),

                                // fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: checkboxValue,
                                onChanged: (bool? value) {
                                  if (checkboxValue == false) {
                                    setState(() {
                                      checkboxValue = true;
                                      isChecked = true;
                                    });
                                  } else if (checkboxValue == true) {
                                    setState(() {
                                      checkboxValue = false;
                                      isChecked = false;
                                    });
                                  }
                                }),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'I agree to the ',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: 'terms and conditions',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      TermsAndConditions()));
                                        },
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.green),
                                    ),
                                    WidgetSpan(
                                        child: SizedBox(
                                      width: 5,
                                    )),
                                    TextSpan(
                                      text: '&',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    WidgetSpan(
                                        child: SizedBox(
                                      width: 5,
                                    )),
                                    TextSpan(
                                      text: ' Privacy policy!',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      PrivacyPolicyPage()));
                                        },
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
