import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_contest_flutter/main.dart';
import 'package:go_contest_flutter/widgets/appbar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: 'Privacy Policy',
          icon: Icons.arrow_back,
          titleColor: Colors.white),
    );
  }
}
