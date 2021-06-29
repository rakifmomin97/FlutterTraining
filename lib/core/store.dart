import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catelog.dart';

class MyStore extends VxStore {
  CatelogModel catelog = CatelogModel();
  CartModel cart = CartModel();

  MyStore() {
    catelog = CatelogModel();
    cart = CartModel();
    cart.catelog = catelog;
  }
}
