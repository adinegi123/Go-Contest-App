import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

import '../../utils/image.dart';
import '../../widgets/elevated button.dart';
import '../Welcome Screen/welcome_screen_one.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<OnBoardModel> onBoardData = [
    OnBoardModel(
      title: 'JOIN CONTEST',
      description:
          "Play as many contests and tournaments to compete with the users worldwide.",
      imgUrl: AppConstant.onBoardingSc1,
    ),
    OnBoardModel(
      title: 'EARN CONTEST',
      description:
          "Each contest and tournaments will give you a chance to earn your winnings.",
      imgUrl: AppConstant.onBoardingSc2,
    ),
    OnBoardModel(
      title: "PRIVATE CONTEST",
      description:
          "You can create your own private contest and share with a group of people to compete.",
      imgUrl: AppConstant.onBoardingSc3,
    ),
    OnBoardModel(
      title: "REFER EARN",
      description:
          "Keep referring the GoContest App and earn some rewards on each referral. ",
      imgUrl: AppConstant.onBoardingSc4,
    ),
  ];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppConstant.background,
              fit: BoxFit.cover,
            )),
        OnBoard(
          pageController: _pageController,
          onBoardData: onBoardData,
          imageHeight: 300,
          imageWidth: 250,
          titleStyles: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 500),
          skipButton: TextButton(child: Text(" "), onPressed: () {}),
          descriptionStyles: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          pageIndicatorStyle: PageIndicatorStyle(
            width: 50,
            inactiveColor: Colors.white,
            activeColor: Colors.purple,
            inactiveSize: const Size(7, 10),
            activeSize: const Size(20, 11),
          ),
          nextButton: OnBoardConsumer(
            builder: (context, ref, child) {
              final state = ref.watch(onBoardStateProvider);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   margin: const EdgeInsets.only(
                    //       left: 18, right: 18, bottom: 20),
                    //   // width: double.infinity,
                    //   height: 50,
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30),
                    //       color: Colors.purple),
                    //   child: Text(
                    //     state.isLastPage ? "Next" : "Next",
                    //     style: const TextStyle(
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    Text(' '),
                    // Container(
                    //   height: 35,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     color: Colors.white,
                    //   ),
                    //   margin: EdgeInsets.symmetric(horizontal: 10),
                    //   child: TextButton(
                    //       onPressed: () {
                    //         _onNextTap(state);
                    //       },
                    //       child: Text(
                    //         state.isLastPage ? "Next" : "Next",
                    //         style: const TextStyle(
                    //           color: Colors.purple,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       )),
                    // ),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: MyElevatedButton(
                          label: state.isLastPage ? "Next" : "Next",
                          onPressed: () {
                            _onNextTap(state);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ));
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutSine,
      );
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => WelcomeScreenOne()));
    }
  }
}
