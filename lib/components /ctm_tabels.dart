import 'package:flutter/material.dart';
import 'package:request_list_task/components%20/ctm_txt.dart';
import 'package:request_list_task/utils/constants.dart';
import 'package:request_list_task/utils/helper_method.dart';

import '../model/restaurant_tabels.dart';
import '../views/order_screen.dart';
import 'ctm_progress.dart';

class CustomListTabels extends StatelessWidget {
  const CustomListTabels({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<RestaurantTabels>>(
        future: HelperMethod().getRestaurantTables(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomProgressIndicator(),
                CustomTxt(
                  'error',
                  color: Colors.black,
                )
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomProgressIndicator();
          }
          if (snapshot.hasData) {
            final newTabel = snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              ),
              itemCount: newTabel?.length ?? 0,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              PickAnOrderScreen(resturnTabelNumber: index + 1))),
                  child: Container(
                    padding: EdgeInsets.all(mainPadding),
                    margin: EdgeInsets.all(mainMargin),
                    decoration: BoxDecoration(
                      color: newTabel![index].isOrdered
                          ? Colors.red.shade400
                          : Colors.black45,
                      borderRadius: BorderRadius.circular(mainRadius),
                      border: Border.all(color: mainColor, width: 2.0),
                    ),
                    child: Column(
                      children: [
                        CustomTxt(txtNumOfTabel +
                            newTabel[index].tabelNumber.toString()),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const CustomProgressIndicator();
          }
        },
      ),
    );
  }
}
