import 'package:flutter/material.dart';
import 'package:request_list_task/components%20/ctm_txt.dart';
import 'package:request_list_task/utils/constants.dart';

class CustomDivider extends Container {
  final double? cWidth;
  final String? title;
  final double? cPadding;
  final double? cMargin;
  final Color? bgColor;
  CustomDivider(
      {super.key, this.cWidth,this.title, this.cPadding, this.cMargin, this.bgColor})
      : super(
            width: cWidth,
            padding: EdgeInsets.all(cPadding ?? 12.0),
            margin: EdgeInsets.all(cMargin ?? 0.0),
            decoration: BoxDecoration(color: bgColor ?? secondryColor),
            child: CustomTxt(title ?? ''));
}
