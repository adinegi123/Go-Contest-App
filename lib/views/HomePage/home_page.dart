import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_contest_flutter/views/Notification/notification.dart';
import 'package:go_contest_flutter/widgets/appbar.dart';

import '../../utils/colors.dart';
import '../../utils/image.dart';
import '../../widgets/elevated button.dart';
import '../Welcome Screen/welcome_screen_one.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 1;
  final List<Tab> myTabs = <Tab>[
    Tab(
        child: Text(
      'Contests',
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
    )),
    Tab(
        child: Text('Tournaments',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold))),
    Tab(
        child: Text(
      'Completed',
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
    )),
  ];

  int get tabIndex => _tabIndex;

  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  List<String> tabTitle = ['Contests', 'Tournaments', 'Completed'];

  late PageController pageController;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
    tabController = TabController(
      initialIndex: 0,
      length: myTabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          centerTitle: true,
          icon: Icons.menu,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NotificationPage()));
              },
              child: Image.asset(
                AppConstant.myNotification,
                height: 35,
                width: 35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 12),
              child: Image.asset(
                AppConstant.myCoins,
                height: 35,
                width: 35,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                    height: 130,
                    child: Image.asset('assets/images/banner.png')),
                DefaultTabController(
                    length: 3, // length of tabs
                    initialIndex: 0,
                    child: Column(
                        // crossAxisAlignment:
                        //     CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TabBar(
                              labelColor: Colors.redAccent,
                              unselectedLabelColor: ColorConst.buttonColor,
                              // indicatorColor: Colors.redAccent,
                              indicatorSize: TabBarIndicatorSize.tab,
                              isScrollable: true,
                              controller: tabController,
                              onTap: (index) {
                                tabIndex = index;
                                pageController.jumpToPage(tabIndex);
                              },
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.redAccent,
                                ),
                              ),
                              // labelStyle: const TextStyle(fontSize: 11.4),
                              // indicatorSize: AboutListTile,
                              tabs: myTabs),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .65,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                PageView(
                                  controller: pageController,
                                  onPageChanged: (v) {
                                    tabIndex = v;
                                  },
                                  children: [
                                    contestListBuilder(),
                                    buildTournamentsListBuilder(),
                                    completedListBuilder()
                                  ],
                                )
                              ],
                            ),
                          )
                        ])),
              ],
            ),
          ),
        ));
  }

  Widget buildTournamentsListBuilder() {
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
                              '35 Questions',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorConst.lightblack,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.redAccent)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image.asset(
                                      AppConstant.myContests,
                                      height: 12,
                                      width: 12,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Text(
                                    'Play & Win: ',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '₹5000',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Entry Fees: 100',
                              style: TextStyle(
                                fontSize: 13,
                                color: ColorConst.lightblack,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                'Ends in 00:45:03',
                                style: TextStyle(
                                    fontSize: 12, color: ColorConst.lightblack),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                '2500 slots left',
                                style: TextStyle(
                                    fontSize: 9, color: ColorConst.lightblack),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppConstant.isLive,
                                    color: Colors.green,
                                    height: 15,
                                    width: 15,
                                  ),
                                  Text(
                                    'Live',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: ColorConst.buttonColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'Play Now',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
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

  Widget contestListBuilder() {
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
                              '25 Questions',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorConst.lightblack,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.redAccent)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Image.asset(
                                      AppConstant.myContests,
                                      height: 12,
                                      width: 12,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Text(
                                    'Play & Win: ',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '₹5000',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Entry Fees: 100',
                              style: TextStyle(
                                fontSize: 13,
                                color: ColorConst.lightblack,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Ends in 00:45:03',
                                style: TextStyle(
                                    fontSize: 12, color: ColorConst.lightblack),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 3),
                              child: Text(
                                '2500 Users playing',
                                style: TextStyle(
                                    fontSize: 9, color: ColorConst.lightblack),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(' '),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        AppConstant.isLive,
                                        color: Colors.green,
                                        height: 15,
                                        width: 15,
                                      ),
                                      Text(
                                        'Live',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 3),
                                  decoration: BoxDecoration(
                                      color: ColorConst.buttonColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'Join Now',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Ends in 00:45:03',
                                style: TextStyle(
                                    fontSize: 12, color: ColorConst.lightblack),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                '2500 Users playing',
                                style: TextStyle(
                                    fontSize: 9, color: ColorConst.lightblack),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    AppConstant.isLive,
                                    color: Colors.green,
                                    height: 15,
                                    width: 15,
                                  ),
                                  Text(
                                    'Live',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 3),
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
