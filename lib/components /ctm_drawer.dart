import 'package:flutter/material.dart';
import 'package:request_list_task/components%20/ctm_txt.dart';
import 'package:request_list_task/utils/constants.dart';
import 'package:request_list_task/views/home_screen.dart';

import '../views/all_orders.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: mainColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTxt(
                'Hello :)',
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            title: const Text(appBarHome),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false);
            },
          ),
          ListTile(
            title: const Text(appBarALL),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AllOrders()));
            },
          ),
        ],
      ),
    );
  }
}
