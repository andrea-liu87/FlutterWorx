import 'package:flutter/material.dart';
import 'package:worx/theme/worx_theme.dart';

// divider on each form field
Widget divider = Container(height: 2,
  color: WorxThemeData.dividerColor,
  margin: const EdgeInsets.symmetric(vertical: 12),);

Widget margin16pxHeight = const SizedBox(height: 16,);
Widget margin8pxHeight = const SizedBox(height: 8,);
const double marginHorizontal = 16;

TextStyle titleField(BuildContext context) => TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoMono');
TextStyle descrField(BuildContext context) => TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'RobotoMono');