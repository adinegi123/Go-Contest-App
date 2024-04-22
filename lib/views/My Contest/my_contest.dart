import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_contest_flutter/utils/colors.dart';

import '../../utils/image.dart';
import '../../widgets/appbar.dart';

class MyContest extends StatefulWidget {
  const MyContest({Key? key}) : super(key: key);

  @override
  State<MyContest> createState() => _MyContestState();
}

class _MyContestState extends State<MyContest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            title: 'My Contests',
            centerTitle: true,
            icon: Icons.arrow_back,
            titleColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: completedListBuilder(),
        ));
  }

  Widget completedListBuilder() {
    return ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: 100,
              // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Stack(
                children: [
                  Container(
                      width: double.infinity,
                      child: Image.asset('assets/images/tile.png')),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                            margin: EdgeInsets.only(left: 18),
                            child: Image.asset('assets/images/brain.png')),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Congratulations',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: ColorConst.lightblack,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.redAccent)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: Icon(
                                      Icons.stars_rounded,
                                      size: 19,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Rank 30 ',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Won ',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '₹20 ',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              '10 January 2023',
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorConst.lightblack,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                decoration: BoxDecoration(
                                    color: ColorConst.buttonColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  'View Details',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ));
        });
  }
}
