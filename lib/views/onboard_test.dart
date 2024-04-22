import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_contest_flutter/utils/colors.dart';
import 'package:go_contest_flutter/utils/image.dart';

import '../widgets/elevated button.dart';
import 'onboarding screen/onboard_model_class.dart';

class OnBoardScreenTestPage extends StatefulWidget {
  const OnBoardScreenTestPage({Key? key}) : super(key: key);

  @override
  State<OnBoardScreenTestPage> createState() => _OnBoardScreenTestPageState();
}

class _OnBoardScreenTestPageState extends State<OnBoardScreenTestPage> {
  final PageController _pageController = PageController();
  int _activePage = 0;

  // List onboardData = [
  //   {
  //     "join contest":
  //         "Play as many contests and tournaments to compete with the users worldwide."
  //   },
  //   {
  //     "earn contest":
  //         "Each contest and tournaments will give you a chance to earn your winnings."
  //   },
  //   {
  //     "private contest":
  //         "You can create your own private contest and share with a group of people to compete."
  //   }
  // ];
  List<OnBoardModelData> onboardModelDataList = [
    OnBoardModelData(
        imgUrl: AppConstant.onBoardingSc1,
        title: AppConstant.title1,
        subtitle: AppConstant.descriptionOne),
    OnBoardModelData(
        imgUrl: AppConstant.onBoardingSc2,
        title: AppConstant.title2,
        subtitle: AppConstant.descriptionTwo),
    OnBoardModelData(
        imgUrl: AppConstant.onBoardingSc3,
        title: AppConstant.title3,
        subtitle: AppConstant.descriptionThree),
  ];
  List<Widget> pages = [
    // PageOne(),
    // PageTwo(),
    // PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Container(
          //     width: double.infinity,
          //     height: double.infinity,
          //     child: Image.asset(
          //       'assets/images/bg2.png',
          //       fit: BoxFit.cover,
          //     )),
          // Positioned(
          //     top: 3,
          //     bottom: 2,
          //     left: 1,
          //     right: 1,
          //     child: Image.asset(AppConstant.onBoardingSc2)),
          // Positioned(
          //     bottom: 1,
          //     left: 1,
          //     right: 1,
          //     child: Container(
          //       height: 200,
          //       color: Colors.white,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(
          //             horizontal: 18.0, vertical: 10),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               'EARN CONTEST',
          //               style: TextStyle(
          //                   color: ColorConst.buttonColor,
          //                   fontSize: 25.sp,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //             Text(
          //               'Each contest and tournaments will give you a chance to earn your winnings.',
          //               style: TextStyle(
          //                   color: ColorConst.lightblack, fontSize: 14.sp),
          //             ),
          //             Text(
          //               'Get Started',
          //               style: TextStyle(
          //                   color: ColorConst.buttonColor,
          //                   fontSize: 14.sp,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Icon(Icons.account_balance_wallet),
          //                 TextButton(onPressed: () {}, child: Text('Next'))
          //               ],
          //             )
          //           ],
          //         ),
          //       ),
          //     ))
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: onboardModelDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return stackedOnboard(onboardModelDataList[index]);
            },
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    onboardModelDataList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: _activePage == index
                                      ? Colors.amber
                                      : Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
          ),
          Positioned(
              right: 1,
              bottom: 20,
              child: Container(
                height: 50,
                width: 100,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: MyElevatedButton(
                  label: "Next",
                  onPressed: () {
                    // int index = _activePage;
                    setState(() {
                      _pageController.animateToPage(4,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget stackedOnboard(OnBoardModelData onBoardModelData) {
    return Stack(fit: StackFit.expand, children: [
      Container(
          color: Colors.red,
          child: Image.asset(
            'assets/images/bg2.png',
            fit: BoxFit.cover,
          )),
      Positioned(
          top: 3,
          bottom: 2,
          left: 1,
          right: 1,
          child: Image.asset(onBoardModelData.imgUrl)),
      Positioned(
          bottom: 1,
          left: 1,
          right: 1,
          child: Container(
              height: 200,
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        onBoardModelData.title,
                        style: TextStyle(
                            color: ColorConst.primaryTextColor,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        onBoardModelData.subtitle,
                        style: TextStyle(
                            color: ColorConst.lightblack, fontSize: 14.sp),
                      ),
                      Text(
                        'Get Started',
                        style: TextStyle(
                            color: ColorConst.primaryTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))))
    ]);
  }
}
