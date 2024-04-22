import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_contest_flutter/utils/image.dart';
import 'package:go_contest_flutter/views/My%20Contest/my_contest.dart';

import '../utils/colors.dart';
import '../views/HomePage/home_page.dart';
import '../views/Refer and Earn/refer_and_earn.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _tabIndex = 1;

  int get tabIndex => _tabIndex;

  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        extendBody: true,
        // drawer: const MyDrawer(),
        drawer: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.87,
            child: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            AppConstant.curvedBackground,
                          ),
                        )),
                    child: Stack(
                      children: [
                        Positioned(
                            right: 1,
                            top: 5,
                            child: Image.asset(
                              AppConstant.profileAvatar,
                              height: 80,
                              width: 80,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 5),
                            Text(
                              'Guest User',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "+91 8887697854",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.home,
                          ),
                          title: const Text('Add Post'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.call,
                          ),
                          title: const Text('Contact Us'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.verified_user_sharp),
                          title: const Text('About Us'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('Logout'),
                          onTap: () {
                            // logout(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        body: WillPopScope(
          onWillPop: onexit,
          // child: PageView(
          //   controller: pageController,
          //   onPageChanged: (v) {
          //     tabIndex = v;
          //   },
          //   children: [MyContest(), HomePage(), ReferAndEarn()],
          // ),
          child: IndexedStack(
            index: _tabIndex,
            children: const [MyContest(), HomePage(), ReferAndEarn()],
          ),
        ),
        bottomNavigationBar: CircleNavBar(
          activeIcons: [
            Image.asset(
              AppConstant.myContests,
              height: 10,
              width: 24,
            ),
            const Icon(Icons.home, color: Colors.white),
            Image.asset(
              AppConstant.referenceImage,
              height: 30,
              width: 24,
            ),
          ],
          inactiveIcons: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Image.asset(
                    AppConstant.myContests,
                    height: 22,
                    width: 24,
                  ),
                  Text("My Contests", style: TextStyle(fontSize: 11.sp)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  // Image.asset(
                  //   AppConstant.myHome,
                  //   height: 22,
                  //   width: 24,
                  //   color: Colors.white,
                  // ),
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  // Text("Home", style: TextStyle(fontSize: 11.sp)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Image.asset(
                    AppConstant.referenceImage,
                    height: 22,
                    width: 24,
                  ),
                  Text(
                    "Refer and Earn",
                    style: TextStyle(fontSize: 11.sp),
                  ),
                ],
              ),
            ),
          ],
          color: ColorConst.buttonColor,
          height: 58,
          circleWidth: 50,
          activeIndex: tabIndex,
          circleColor: ColorConst.buttonColor,
          onTap: (index) {
            tabIndex = index;
            // pageController.jumpToPage(tabIndex);
          },
          padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            // bottomRight: Radius.circular(24),
            // bottomLeft: Radius.circular(24),
          ),
          shadowColor: Colors.white,
          elevation: 3,
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomBar({required Widget icon, String? lable}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: lable,
    );
  }

  Future<bool> onexit() async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Container(
            margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
            height: 100,
            child: Column(
              children: <Widget>[
                const Text("Are you sure you want to exit?"),
                Container(
                  margin: const EdgeInsets.only(top: 22),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //       color:
                            //           ColorConst.buttonColor,
                            //       offset: const Offset(0.0, 1.0),
                            //       blurRadius: 1.0,
                            //       spreadRadius: 0.0)
                            // ],
                            color: ColorConst.buttonColor.withOpacity(0.70),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            "No",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // SystemChannels.platform
                          //     .invokeMethod('SystemNavigator.pop');
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: ColorConst.buttonColor
                            //           .withOpacity(0.1)
                            //           .withOpacity(0.1),
                            //       offset: const Offset(0.0, 1.0),
                            //       blurRadius: 1.0,
                            //       spreadRadius: 0.0)
                            // ],
                            color: ColorConst.buttonColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text("Yes",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
