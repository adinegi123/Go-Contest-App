import 'package:flutter/material.dart';
import 'package:go_contest_flutter/views/Welcome%20Screen/otp_after_welcome_screen.dart';
import 'package:go_contest_flutter/widgets/TextFormField.dart';

import '../../utils/image.dart';

class WelcomeScreenWithReferral extends StatefulWidget {
  const WelcomeScreenWithReferral({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenWithReferral> createState() =>
      _WelcomeScreenWithReferralState();
}

class _WelcomeScreenWithReferralState extends State<WelcomeScreenWithReferral> {
  bool checkboxValue = false;
  bool isChecked = false;
  TextEditingController phone_no_controller = TextEditingController();
  TextEditingController _referralCodeController = TextEditingController();

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
                top: 3,
                left: 1,
                right: 1,
                bottom: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Container(child: Image.asset(AppConstant.logo)),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Welcome",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyTextFormField(
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
                          SizedBox(
                            height: 15,
                          ),
                          MyTextFormField(
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
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueAccent,
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              OtpAfterWelcomeScreenPage()));
                                },
                                child: Text(
                                  "Continue",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  checkColor: Colors.white,
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
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I agree to the ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: 'terms and conditions',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.green),
                                      ),
                                      WidgetSpan(
                                          child: SizedBox(
                                        width: 5,
                                      )),
                                      TextSpan(
                                        text: '&',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      WidgetSpan(
                                          child: SizedBox(
                                        width: 5,
                                      )),
                                      TextSpan(
                                        text: ' Privacy policy!',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                            decoration:
                                                TextDecoration.underline,
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
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
