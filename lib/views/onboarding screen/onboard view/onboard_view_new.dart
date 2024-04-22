import 'package:flutter/material.dart';
import 'package:go_contest_flutter/utils/image.dart';
import 'package:go_contest_flutter/views/HomePage/home_page.dart';
import 'package:go_contest_flutter/views/Welcome%20Screen/welcome_screen_one.dart';
import 'package:go_contest_flutter/views/onboarding%20screen/onboard%20view/pageview%20body.dart';
import 'package:go_contest_flutter/widgets/elevated%20button.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../utils/colors.dart';

class OnBoardPageNew extends StatefulWidget {
  const OnBoardPageNew({Key? key}) : super(key: key);

  @override
  State<OnBoardPageNew> createState() => _OnBoardPageNewState();
}

class _OnBoardPageNewState extends State<OnBoardPageNew> {
  PageController controller = PageController();
  List<Widget> pageList = const [
    PageViewBody(
      title: AppConstant.title1,
      subtitle: AppConstant.descriptionOne,
      img: AppConstant.onBoardingSc1,
    ),
    PageViewBody(
      title: AppConstant.title2,
      subtitle: AppConstant.descriptionTwo,
      img: AppConstant.onBoardingSc2,
    ),
    PageViewBody(
      title: AppConstant.title3,
      subtitle: AppConstant.descriptionThree,
      img: AppConstant.onBoardingSc3,
    ),
    PageViewBody(
      title: AppConstant.title4,
      subtitle: AppConstant.descriptionFour,
      img: AppConstant.onBoardingSc4,
    ),
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1 - 75,
            width: MediaQuery.of(context).size.width / 1,
            child: Container(
              decoration: BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage(AppConstant.background),
                fit: BoxFit.fill,
              )),
            ),
          ),
          Positioned(
            top: 0,
            left: 0.0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1 - 70,
              width: MediaQuery.of(context).size.width / 1,
              child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  onPageChanged: (num) {
                    setState(() {
                      _curr = num;
                    });
                  },
                  children: pageList),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            height: 120,
            width: MediaQuery.of(context).size.width / 1,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 90,
                          child: PageViewDotIndicator(
                            currentItem: _curr,
                            size: const Size(9, 9),
                            count: pageList.length,
                            unselectedColor: Colors.purple,
                            selectedColor: ColorConst.buttonColor,
                            duration: const Duration(milliseconds: 200),
                            boxShape: BoxShape.circle,
                            onItemClicked: (index) {
                              controller.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.elasticIn,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 100,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: MyElevatedButton(
                              label: "Next",
                              onPressed: () {
                                if (_curr < pageList.length - 1) {
                                  setState(() {
                                    _curr = _curr + 1;
                                  });
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.ease);
                                } else {
                                  // SharedPrefHelper.setOnboardData().then((value) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (_) => const LoginView()));
                                  // }
                                  //
                                  // );
                                  print('next page');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => WelcomeScreenOne()));
                                }
                              },
                            ),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          )),
    );
  }
// void _onNextTap(OnBoardState onBoardState) {
//   if (!onBoardState.isLastPage) {
//     _pageController.animateToPage(
//       onBoardState.page + 1,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOutSine,
//     );
//   } else {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (_) => WelcomeScreenOne()));
//   }
// }
}
