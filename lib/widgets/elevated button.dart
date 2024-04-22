import 'package:flutter/material.dart';
import 'package:go_contest_flutter/utils/colors.dart';

class MyElevatedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final bool? isLoading;

  const MyElevatedButton(
      {Key? key, required this.label, this.onPressed, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: isLoading! ? () {} : onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorConst.buttonColor,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            child: isLoading!
                ? const SizedBox(
                    height: 16.0,
                    width: 16.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
          ),
        ),
      ],
    );
  }
}
