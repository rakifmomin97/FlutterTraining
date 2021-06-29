import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import 'catelog_image.dart';

class CatelogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModel.items.length,
      itemBuilder: (context, index) {
        final catelog = CatelogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsHomePage(catelog: catelog),
            ),
          ),
          child: CatelogItem(
            catelog: catelog,
          ),
        );
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catelog;

  const CatelogItem({Key? key, required this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catelog.id.toString()),
            child: CatelogImage(
              image: catelog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catelog.name.text.medium.color(context.accentColor).bold.make(),
              catelog.desc.text
                  .textStyle(context.captionStyle as TextStyle)
                  .make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.m0,
                children: [
                  "\$${catelog.price}".text.bold.xl.make(),
                  _AddToCart(catelog: catelog),
                ],
              ).pOnly(right: 8),
            ],
          ))
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catelog;
  const _AddToCart({
    Key? key,
    required this.catelog,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catelog = CatelogModel();
        final _cart = CartModel();
        _cart.catelog = _catelog;
        _cart.addItems(widget.catelog);
        setState(() {});
      },
      child: isAdded ? Icon(Icons.done) : "Add to Cart".text.make(),
    );
  }
}
