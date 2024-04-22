import 'package:flutter/material.dart';
import 'package:go_contest_flutter/widgets/appbar.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: 'Terms and Conditions',
          icon: Icons.arrow_back,
          titleColor: Colors.white),
    );
  }
}
