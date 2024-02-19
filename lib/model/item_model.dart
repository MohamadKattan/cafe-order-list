import '../utils/constants.dart';

class ItemModel {
  int? idItem;
  String? nameItem;
  String? typeItem;
  int? priceItem;
  String? imgItem;
  ItemModel(
      {this.idItem,
      required this.nameItem,
      required this.typeItem,
      required this.priceItem,
      required this.imgItem});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      name: nameItem,
      type: typeItem,
      price: priceItem,
      img: imgItem
    };
    if (idItem != null) {
      map['_id'] = idItem;
    }
    return map;
  }

  ItemModel.fromMap(Map<String, dynamic> map) {
    idItem = map[id];
    nameItem = map[name];
    typeItem = map[type];
    priceItem = map[price];
    imgItem = map[img];
  }
}
