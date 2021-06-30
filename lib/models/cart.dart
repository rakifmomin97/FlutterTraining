import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

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

}

//Adding items to list
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

//Removing items from list
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
