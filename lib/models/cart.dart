import 'package:flutter_catalog/models/catelog.dart';

class CartModel {

  //Catelog field
  late CatelogModel _catelog;

  //List of all item IDs
  final List<int> _itemIds = [];

  //Getter of catelog model
  CatelogModel get catelog => _catelog;

  //Setter of catelog model
  set catelog(CatelogModel newCatelog) => _catelog = newCatelog;

  //Getting items in cart
  List<Item> get items => _itemIds.map((id) => _catelog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Adding items to list
  void addItems(Item item) => _itemIds.add(item.id);

  //Removing items from list
  void removeItems(Item item) => _itemIds.remove(item.id);
}
