import 'package:flutter/material.dart';
import 'package:request_list_task/components%20/ctm_txt.dart';
import 'package:request_list_task/utils/constants.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback voidCallback;
  final String? txt;
  final Color? cColor;
  const CustomBtn({super.key, required this.voidCallback, this.txt, this.cColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => voidCallback(),
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(mainPadding),
            decoration: BoxDecoration(
                color: cColor ?? btnColor,
                border: Border(
                    left: BorderSide(color: mainColor, width: 1.0),
                    right: BorderSide(color: mainColor, width: 1.0))),
            child: CustomTxt(
              txt ?? '',
              color: mainColor,
            )),
      ),
    );
  }
}
