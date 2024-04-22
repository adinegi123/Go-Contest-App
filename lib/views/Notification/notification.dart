import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_contest_flutter/utils/colors.dart';
import 'package:go_contest_flutter/utils/image.dart';

import '../../widgets/appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: true,
        icon: Icons.arrow_back,
        title: 'Notifications',
        titleColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(' '),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                    ),
                    child: Text(
                      'Clean All',
                      style: TextStyle(
                          color: ColorConst.lightblack,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            notificationBuilder()
          ],
        ),
      ),
    );
  }

  Widget notificationBuilder() {
    return ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 170,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Game Found',
                          style: TextStyle(
                              color: ColorConst.buttonColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: ColorConst.buttonColor,
                            ),
                            Text(
                              '10-01-2023',
                              style: TextStyle(
                                color: ColorConst.lightblack,
                                fontSize: 11.sp,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                '11:00 PM',
                                style: TextStyle(
                                  color: ColorConst.lightblack,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(),
                    Container(
                      child: Text(
                        'Lorem ipsum is simply dummy text of the printing and\ntypesett-it is a long established\nfact that a reader will be distracted by the readablecontent of a page when looking at its layout.',
                        style: TextStyle(
                            color: ColorConst.lightblack, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
