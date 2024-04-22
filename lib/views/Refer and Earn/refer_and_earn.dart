import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_contest_flutter/utils/colors.dart';
import 'package:go_contest_flutter/utils/image.dart';
import 'package:go_contest_flutter/widgets/appbar.dart';
import 'package:http/http.dart' as http;

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Refer and Earn',
        icon: Icons.arrow_back,
        titleColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.purple,
                  Colors.blue.shade900,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    'Refer Your Friends',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.sp),
                  ),
                ),
                Center(
                  child: Text(
                    'And Earn',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.sp),
                  ),
                ),
                Container(
                    height: 170,
                    width: 220,
                    child: Image.asset(AppConstant.referShareImage)),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Text(
                      '₹ 100',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                      'Share This Link With Your Friend And After They Install, Both Of You Will Get ₹100 Cash Rewards.',
                      style: TextStyle(color: Colors.white, fontSize: 13.sp)),
                ),
                Container(
                  width: 140,
                  height: 35,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Aby123',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          )),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Clipboard.setData(
                                new ClipboardData(text: 'Copied text here'));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: ColorConst.buttonColor,
                                content: Text('Copied to your clipboard !')));
                          });
                        },
                        child: Icon(
                          Icons.copy,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            AppConstant.facebookImage,
                            height: 40,
                            width: 40,
                          ),
                          Text(
                            'Facebook',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          // _onShare(context);
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              AppConstant.watsappImage,
                              height: 40,
                              width: 40,
                            ),
                            Text(
                              'Whatsapp',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.share,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            Text(
                              'Others',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
