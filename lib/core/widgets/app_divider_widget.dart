import 'package:flutter/material.dart';
import 'package:market_test/core/config/theme.dart';

class AppCommonDividerWidget extends StatelessWidget {
  const AppCommonDividerWidget({
    Key? key,
    this.color,
    this.height,
    this.thickness,
    this.indentValue,
  }) : super(key: key);

  /// widget color
  final Color? color;

  /// padding from sides
  final double? indentValue;

  final double? height;

  /// divider thick
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 1,
      height: height ?? 0,
      endIndent: indentValue ?? 20,
      indent: indentValue ?? 20,
      color: color ?? AppColors.lightGrey,
    );
  }
}