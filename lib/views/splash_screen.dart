import 'package:flutter/material.dart';
import 'package:go_contest_flutter/views/onboarding%20screen/onboard%20view/onboard_view_new.dart';

import '../utils/image.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const OnBoardPageNew()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                AppConstant.background,
                fit: BoxFit.cover,
              )),
          Positioned(
              left: 1,
              right: 1,
              top: 1,
              bottom: 1,
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(AppConstant.logo)))
        ],
      ),
    );
  }
}
