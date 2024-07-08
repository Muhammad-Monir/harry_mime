import 'package:flutter/material.dart';

Widget AuthCustomeButton({
  required String name,
  required VoidCallback onCallBack,
  required double height,
  required double minWidth,
  required double borderRadius,
  required Color color,
  required TextStyle textStyle,
  required BuildContext context,
  required Gradient gradient,
}) {
  return Container(
    height: height,
    width: minWidth,
    decoration: BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: MaterialButton(
      onPressed: onCallBack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      splashColor: Colors.white.withOpacity(0.4),
      child: Text(
        name,
        style: textStyle,
      ),
    ),
  );
}
