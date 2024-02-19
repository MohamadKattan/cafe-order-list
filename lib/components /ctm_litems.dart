import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_list_task/model/item_model.dart';
import 'package:request_list_task/model/orders_model.dart';

import '../controllers /orders_controller.dart';
import '../utils/constants.dart';
import 'ctm_progress.dart';
import 'ctm_txt.dart';

class CustomListItem extends StatelessWidget {
  final List<ItemModel> list;
  final VoidCallback? voidCallback;
  final int resturnTabelNumber;
  const CustomListItem(
      {super.key,
      required this.list,
      this.voidCallback,
      required this.resturnTabelNumber});

  @override
  Widget build(BuildContext context) {
    final pickerOrder = context.read<OrdersController>();
    return list.isEmpty
        ? const CustomProgressIndicator()
        : Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(34, 203, 154, 154),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 175,
              ),
              itemCount: list.length,
              itemBuilder: (_, index) {
                var newItem = list;
                return GestureDetector(
                  onTap: () {
                    var newObj = OrdersModel(
                        nameOrder: newItem[index].nameItem ?? '',
                        typeOrder: resturnTabelNumber.toString(),
                        priceOne: newItem[index].priceItem ?? 0,
                        imgOrder: newItem[index].imgItem ?? '',
                        numCount: 1,
                        totelPrice: newItem[index].priceItem ?? 0,
                        totalInvoice: newItem[index].priceItem ?? 0);

                    pickerOrder.updateListPickOrder(newObj);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(newItem[index].imgItem ?? ''),
                          fit: BoxFit.cover),
                      color: secondryColor,
                      borderRadius: BorderRadius.circular(mainRadius),
                      border: Border.all(color: mainColor, width: 2.0),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTxt(
                                  newItem[index].nameItem ?? 'null',
                                  color: mainColor,
                                ),
                                CustomTxt(
                                  newItem[index].priceItem.toString(),
                                  color: mainColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
