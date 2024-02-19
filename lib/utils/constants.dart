import 'package:flutter/material.dart';

import '../model/item_model.dart';


Color mainColor = Colors.black;
Color secondryColor = Colors.grey.shade700;
Color btnColor = Colors.amberAccent;
double mainSpacer = 20.0;
int tabeslNumber = 4; // as dynamic Number Table from dataBase
double mainPadding = 12.0;
double mainMargin = 12.0;
double mainRadius = 8.0;
List<ItemModel> itemsMainDish = [];
List<ItemModel> itemsSoup = [];
List<ItemModel> itemsDrink = [];


// keys Of local dataBase
const String itemDbName = 'item.db';
const String itemTabelName = 'item';
const String kkorderDbName = 'kkorder.db';
const String kkorderTabelName = 'kkorder';
const String id = 'id';
const String type = 'type';
const String name = 'name';
const String price = 'price';
const String img = 'img';
const String count = 'count';
const String totel = 'totel';
const String invoice = 'invoice';
const String kNewOrder = 'neworder';

// txt in Home Screen
const String appBarHome = 'Ресторанный зал';
const String mainDecHome =
    'Ниже списка столов нажмите на стол,\n чтобы выбрать заказ';
const String titleDividerHome = 'Список таблиц';
const String txtNumOfTabel = 'Таблица №:';
const String txtTabelhasOrder = 'был порядок';
const String txtTabelnohasOrder = 'Еще нет заказа';

// txt in order Screen
const String appBarOrder = 'Выбрать заказ';
const String titelMenu = 'Menu';
const String mainDish = 'Основной';
const String soup = 'Суп';
const String drinks = 'Напитки';
const String noOrder = 'Еще не собран заказ...';
const String saveOrder = 'СОХРАНИТЬ';
const String totaltxt = 'Тотель:';

// txt All order SCreen
const String appBarALL = 'Сохраненные заказы';
const String noOrederSave = 'Ни один заказ еще не сохранен...';
const String tabelNo = 'Таблица №:';
const String totelOfInvoice = 'Счет-фактура :';
const String detailsOrdertxt = 'Детали';

// tost msg
const orderSaved = 'Заказ сохранен.';
