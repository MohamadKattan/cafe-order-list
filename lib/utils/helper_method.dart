import 'package:flutter/material.dart';

import '../model/restaurant_tabels.dart';
import 'constants.dart';
import 'dumy_data.dart';

class HelperMethod extends ChangeNotifier {
  int? _indexPerViewPage;
  int? get indexPerViewPage => _indexPerViewPage;

  final List<RestaurantTabels> _listRestaurantTabels = [];

  void changeIndex(int index) {
    _indexPerViewPage = index;
    notifyListeners();
  }

// Имитировать выборку данных из базы данных
  Future<List<RestaurantTabels>> getRestaurantTables() async {
    if (_listRestaurantTabels.length < tabeslNumber) {
      for (var i = 0; i < tabeslNumber; i++) {
        var newTabel = RestaurantTabels(
            tabelNumber: i + 1, isOrdered: false, tabelColor: Colors.white);
        _listRestaurantTabels.add(newTabel);
      }
    }
    return _listRestaurantTabels;
  }

  // Имитировать выборку данных из базы данных
  Future getItems() async {
    for (var i in dumyData) {
      if (i.typeItem!.contains(mainDish)) {
        itemsMainDish.add(i);
      } else if (i.typeItem!.contains(soup)) {
        itemsSoup.add(i);
      } else {
        itemsDrink.add(i);
      }
    }
  }
}
