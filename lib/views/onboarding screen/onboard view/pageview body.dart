import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_contest_flutter/utils/colors.dart';

class PageViewBody extends StatelessWidget {
  final img, title, subtitle;

  const PageViewBody({Key? key, this.img, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 100.0, 00.0, 0.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              // topRight: Radius.circular(40),
              topLeft: Radius.circular(60),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: ColorConst.primaryTextColor,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                        color: ColorConst.lightblack, fontSize: 13.sp),
                    overflow: TextOverflow.clip,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: ColorConst.primaryTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
