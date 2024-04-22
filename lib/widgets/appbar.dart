import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_contest_flutter/utils/colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleName;
  final String? title;
  final Widget? leading;
  final IconData icon;
  final double height;
  final double? elevation;
  final Color? backgroundColor, titleColor, statusBarColor;
  final Brightness? statusBarIconBrightness;
  final bool? centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const MyAppBar(
      {super.key,
      this.titleName,
      this.title,
      this.leading,
      this.height = kToolbarHeight,//custom tool bar height
      this.elevation = 0.0,
      this.backgroundColor = Colors.white,
      this.titleColor,
      this.statusBarColor,
      this.statusBarIconBrightness,
      this.centerTitle = false,
      this.actions,
      this.bottom,
      required this.icon});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //   bottomLeft: Radius.circular(18),
      //   bottomRight: Radius.circular(18),
      // )),
      backgroundColor: ColorConst.buttonColor,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.dark),
      centerTitle: centerTitle,
      bottom: bottom,
      leading: leading ??
          IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            // color: backgroundColor == Colors.transparent
            //     ? Theme.of(context).iconTheme.color
            //     : Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      title: Text(
        title ?? "",
        style: TextStyle(
            color: titleColor ?? Colors.black,
            // fontFamily: "Nunito",
            fontSize: 17,
            letterSpacing: 1,
            fontWeight: FontWeight.w900),
      ),
      actions: actions,
    );
  }
}
