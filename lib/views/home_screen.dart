import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components /ctm_appBar.dart';
import '../components /ctm_divider.dart';
import '../components /ctm_drawer.dart';
import '../components /ctm_tabels.dart';
import '../components /ctm_txt.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Builder(
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            drawer: const CustomDrawer(),
            appBar: CustomAppBar(
                txtTitle: appBarHome, context: context, isHomeScreen: true),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(mainSpacer),
                Center(
                    child: CustomTxt(
                  mainDecHome,
                  color: Colors.black,
                )),
                Gap(mainSpacer),
                CustomDivider(
                  title: titleDividerHome,
                  cWidth: screenWidth,
                ),
                Gap(mainSpacer),
                const CustomListTabels()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
