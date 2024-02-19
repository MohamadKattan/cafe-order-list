import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_list_task/views/details_order.dart';

import '../components /ctm_appbar.dart';
import '../components /ctm_drawer.dart';
import '../components /ctm_txt.dart';
import '../controllers /orders_controller.dart';
import '../utils/constants.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  void initState() {
    Provider.of<OrdersController>(context, listen: false).getOrdersFromLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.read<OrdersController>().deleteAllFromLocale();
              },
              child: const Icon(Icons.delete),
            ),
            drawer: const CustomDrawer(),
            appBar: CustomAppBar(txtTitle: appBarALL, context: context),
            body: _displayListOrders());
      }),
    );
  }

  _displayListOrders() {
    var listAllOrders = context.watch<OrdersController>().listOrders;
    return listAllOrders.isNotEmpty
        ? ListView.builder(
            itemCount: listAllOrders.length,
            itemBuilder: (_, index) {
              var newObj = listAllOrders[index];
              var convertObj = json.decode(newObj.neworder ?? 'null');
              num totel = 0;
              for (var i in convertObj) {
                totel += i['invoice'];
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailsOrder(
                                    customerListOrder: newObj,
                                    totelArg: totel,
                                    indexList: index,
                                  )));
                    },
                    title: CustomTxt(
                      '$tabelNo ${convertObj[0][type]} ',
                      color: mainColor,
                      txtAlign: TextAlign.start,
                      fSzie: 20,
                    ),
                    subtitle: CustomTxt(
                      '$totelOfInvoice $totel ',
                      color: secondryColor,
                      txtAlign: TextAlign.start,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            },
          )
        : Center(
            child: CustomTxt(
              noOrederSave,
              color: mainColor,
              fSzie: 20,
              fontWeight: FontWeight.bold,
            ),
          );
  }
}
