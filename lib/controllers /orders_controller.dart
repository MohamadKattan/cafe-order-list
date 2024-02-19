import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:request_list_task/model/orders_model.dart';
import 'package:request_list_task/utils/constants.dart';

import '../components /tost_msg.dart';
import 'local_db.dart';

class OrdersController extends ChangeNotifier {
  bool _louding = false;
  bool get louding => _louding;

  int _newInvoice = 0;
  int get newInvoice => _newInvoice;

  List<OrdersModel> _listPickOrder = [];
  List<OrdersModel> get listPickOrder => _listPickOrder;

  List<CustomerListOrder> _listOrders = [];
  List<CustomerListOrder> get listOrders => _listOrders;

  void isLouding(bool loud) {
    _louding = loud;
    notifyListeners();
  }

  Future clearListPickeOrder(List<OrdersModel> val) async {
    _listPickOrder = val;
    _newInvoice = 0;
  }

  void updateListPickOrder(OrdersModel object) {
    bool isFound = false;
    if (_listPickOrder.isEmpty) {
      _newInvoice += object.priceOne;
      _listPickOrder.add(object);
    } else {
      for (var i = 0; i < _listPickOrder.length; i++) {
        if (object.nameOrder == _listPickOrder[i].nameOrder) {
          isFound = true;
          _listPickOrder[i].numCount += 1;
          _listPickOrder[i].totelPrice += _listPickOrder[i].priceOne;
          _listPickOrder[i].totalInvoice += _listPickOrder[i].priceOne;
          _newInvoice += _listPickOrder[i].priceOne;
        }
      }
      if (isFound == true) {
      } else {
        _listPickOrder.add(object);
        _newInvoice += object.priceOne;
      }
    }
    notifyListeners();
  }

  void incrementOrder(int index) {
    _listPickOrder[index].numCount += 1;
    _listPickOrder[index].totelPrice += _listPickOrder[index].priceOne;
    _listPickOrder[index].totalInvoice += _listPickOrder[index].priceOne;
    _newInvoice += _listPickOrder[index].priceOne;
    notifyListeners();
  }

  void discernmentOrder(int index) {
    if (_listPickOrder[index].numCount <= 1) {
      _newInvoice -= _listPickOrder[index].priceOne;
      _listPickOrder.removeAt(index);
    } else {
      _listPickOrder[index].numCount -= 1;
      _listPickOrder[index].totelPrice -= _listPickOrder[index].priceOne;
      _listPickOrder[index].totalInvoice -= _listPickOrder[index].priceOne;
      _newInvoice -= _listPickOrder[index].priceOne;
    }

    notifyListeners();
  }

  Future<void> setNewOrderToLocale(BuildContext context) async {
    isLouding(true);
    String convertToString = '';
    List newList = [];
    int count = 0;
    for (var i in listPickOrder) {
      var newObj = i.toMap();
      newList.add(newObj);
      count += 1;
      if (count == listPickOrder.length) {
        convertToString = jsonEncode(newList);
        await LocalDataBase()
            .setDataToLocalDB(map: {kNewOrder: convertToString});
        TostMsg().displayTostMsg(msg: orderSaved);
        if (!context.mounted) return;
        await context.read<OrdersController>().clearListPickeOrder([]);
      }
    }
    isLouding(false);
  }

  Future getOrdersFromLocal() async {
    _listOrders.clear();
    List<Map<String, dynamic>> newData =
        await LocalDataBase().readDataFromLocalDB();
    for (var i in newData) {
      var oneOrder = CustomerListOrder.fromMap(i);
      _listOrders.add(oneOrder);
    }
    notifyListeners();
  }

  Future deleteOneOrderFromLocale(
      int index, int id, BuildContext context) async {
    _listOrders.removeAt(index);
    await LocalDataBase().deleteOneItem(idItem: id);
    if (!context.mounted) return;
    Navigator.pop(context);
    notifyListeners();
  }

  Future deleteAllFromLocale() async {
    await LocalDataBase().deleteAll();
    _listOrders = [];
    notifyListeners();
  }
}
