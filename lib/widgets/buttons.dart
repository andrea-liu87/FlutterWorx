import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final Color fontColor;
  final Function() onPressed;

  const FullWidthButton({
    Key? key,
    required Color this.backgroundColor,
    required String this.title,
    this.fontColor = Colors.white,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            minimumSize: const Size.fromHeight(52),
            side: BorderSide(color: Colors.black, width: 2)),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium
              ?.copyWith(color: fontColor),
        ),
      );
    }
  }