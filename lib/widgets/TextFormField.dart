import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatefulWidget {
  final String? insidetext;
  final Widget? prefixIcon;
  final String? hintText;
  final int? maxLines;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final bool enable;
  final String? initialValue;
  final controller;

  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onTextChange;

  const MyTextFormField({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.maxLines,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.enable = true,
    this.initialValue,
    this.onTextChange,
    this.keyboardType,
    this.validator,
    this.insidetext,
  }) : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool focus = false;
  late final TextEditingController? textEditingController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    textEditingController = TextEditingController(text: widget.insidetext);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          focus = hasFocus;
        });
      },
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        onTap: widget.onTap,
        readOnly: widget.readOnly!,
        controller: widget.controller,
        initialValue: widget.initialValue,
        enabled: widget.enable,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        onChanged: widget.onTextChange,
        style: TextStyle(fontSize: 15.sp, color: Colors.black),
        decoration: InputDecoration(
          isDense: true,
          fillColor: focus ? Colors.white : Colors.grey.shade100,
          filled: true,
          border: InputBorder.none,
          errorStyle: TextStyle(color: Colors.red, fontSize: 12),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.blue)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red)),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.5),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: widget.prefixIcon,
          ),
          prefixIconConstraints: const BoxConstraints(minHeight: 5),
          suffixIcon: widget.suffixIcon,
        ),
        obscureText: widget.obscureText,
      ),
    );
  }
}
