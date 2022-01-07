import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.text,
      this.buttonColor,
      this.textColor,
      required this.width,
      this.icon,
      this.iconColor,
      required this.textPadding})
      : super(key: key);

  final Function() onTap;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final double width;
  final IconData? icon;
  final Color? iconColor;
  final EdgeInsetsGeometry textPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
            Padding(
              padding: textPadding,
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
