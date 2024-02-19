import 'package:flutter/material.dart';
import 'package:request_list_task/utils/constants.dart';

import 'ctm_txt.dart';

class CustomAppBar extends AppBar {
  final String txtTitle;
  final BuildContext context;
  final bool? isHomeScreen;
  final Color? bgColor;

  CustomAppBar(
      {super.key,
      required this.txtTitle,
      required this.context,
      this.isHomeScreen,
      this.bgColor})
      : super(
          title: CustomTxt(txtTitle),
          centerTitle: false,
          backgroundColor: bgColor ?? mainColor,
           iconTheme:const  IconThemeData(color: Colors.white),
          actions: [
          isHomeScreen ?? false
                ? const SizedBox()
                : IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                  )
          ],
        );
}
