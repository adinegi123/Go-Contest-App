// import 'package:flutter/material.dart';
// import 'package:flutter_onboard/flutter_onboard.dart';
// import 'package:go_contest_flutter/views/Welcome%20Screen/welcome_screen_one.dart';
//
// import '../utils/image.dart';
// import '../widgets/elevated button.dart';
//
// class OnBoardTestTwo extends StatefulWidget {
//   const OnBoardTestTwo({Key? key}) : super(key: key);
//
//   @override
//   State<OnBoardTestTwo> createState() => _OnBoardTestTwoState();
// }
//
// class _OnBoardTestTwoState extends State<OnBoardTestTwo> {
//   final PageController _pageController = PageController();
//   int _activePage = 0;
//   List<OnBoardModel> onBoardData = [
//     OnBoardModel(
//       title: 'JOIN CONTEST',
//       description:
//           "Play as many contests and tournaments to compete with the users worldwide.",
//       imgUrl: AppConstant.onBoardingSc1,
//     ),
//     OnBoardModel(
//       title: 'EARN CONTEST',
//       description:
//           "Each contest and tournaments will give you a chance to earn your winnings.",
//       imgUrl: AppConstant.onBoardingSc2,
//     ),
//     OnBoardModel(
//       title: "PRIVATE CONTEST",
//       description:
//           "You can create your own private contest and share with a group of people to compete.",
//       imgUrl: AppConstant.onBoardingSc3,
//     ),
//     OnBoardModel(
//       title: "REFER EARN",
//       description:
//           "Keep referring the GoContest App and earn some rewards on each referral. ",
//       imgUrl: AppConstant.onBoardingSc4,
//     ),
//   ];
//   int _curr=0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height / 1 - 60,
//             width: MediaQuery.of(context).size.width / 1,
//             child: Container(color: Colors.red,),
//           ),
//           Positioned(
//             top: 0,
//             left: 0.0,
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height / 1 - 70,
//               width: MediaQuery.of(context).size.width / 1,
//               child: PageView(
//                   scrollDirection: Axis.horizontal,
//                   controller: _pageController,
//                   onPageChanged: (num) {
//                     setState(() {
//                       _curr = num;
//                     });
//                   },
//                   children: pageList),
//             ),
//           ),
//         ]),
//       ),
//       bottomNavigationBar: BottomAppBar(
//           elevation: 0,
//           child: Container(
//             height: 60,
//             width: MediaQuery.of(context).size.width / 1,
//             color: AppColors.yellowColor,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(AppConstant.skip),
//                     SizedBox(
//                       width: 100,
//                       child: PageViewDotIndicator(
//                         currentItem: _curr,
//                         count: pageList.length,
//                         unselectedColor: AppColors.cardColor,
//                         selectedColor: AppColors.blackColor,
//                         duration: const Duration(milliseconds: 200),
//                         boxShape: BoxShape.circle,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         if (_curr < pageList.length - 1) {
//                           setState(() {
//                             _curr = _curr + 1;
//                           });
//                           controller.nextPage(
//                               duration: const Duration(milliseconds: 600),
//                               curve: Curves.ease);
//                         } else {
//                           SharedPrefHelper.setOnboardData().then((value) {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (_) => const LoginView()));
//                           });
//                         }
//                       },
//                       child: const CircleAvatar(
//                         radius: 20,
//                         backgroundColor: AppColors.whiteColor,
//                         child: Center(
//                             child: Icon(
//                           Icons.navigate_next,
//                           color: AppColors.yellowColor,
//                         )),
//                       ),
//                     )
//                   ]),
//             ),
//           )),
//     );
//   }
//
//   void _onNextTap(OnBoardState onBoardState) {
//     if (!onBoardState.isLastPage) {
//       _pageController.animateToPage(
//         onBoardState.page + 1,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeInOutSine,
//       );
//     } else {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (_) => WelcomeScreenOne()));
//     }
//   }
// }
