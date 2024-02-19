import '../utils/constants.dart';

class OrdersModel {
  int? idOrder;
  String nameOrder = '';
  String typeOrder = '';
  String imgOrder = '';
  int priceOne = 0;
  int numCount = 1;
  int totelPrice = 0;
  int totalInvoice = 0;
  OrdersModel({
    this.idOrder,
    required this.nameOrder,
    required this.typeOrder,
    required this.priceOne,
    required this.imgOrder,
    required this.numCount,
    required this.totelPrice,
    required this.totalInvoice,
  });

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      name: nameOrder,
      type: typeOrder,
      img: imgOrder,
      price: priceOne,
      count: numCount,
      totel: totelPrice,
      invoice: totalInvoice
    };
    if (idOrder != null) {
      map['id'] = idOrder;
    }
    return map;
  }

  OrdersModel.fromMap(Map<String, dynamic> map) {
    idOrder = map[id];
    nameOrder = map[name];
    typeOrder = map[type];
    priceOne = map[price];
    imgOrder = map[img];
    numCount = map[count];
    totelPrice = map[totel];
    totalInvoice = map[invoice];
  }
}

class CustomerListOrder {
  int? idCoustmer;
  String? neworder;
  CustomerListOrder({this.idCoustmer,this.neworder});

  CustomerListOrder.fromMap(Map<String, dynamic> map) {
    idCoustmer = map[id];
    neworder = map[kNewOrder];
  }
}
