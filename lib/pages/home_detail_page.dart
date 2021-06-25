import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catelog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsHomePage extends StatelessWidget {
  final Item catelog;

  const DetailsHomePage({Key? key, required this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.m0,
          children: [
            "\$${catelog.price}".text.red800.bold.xl3.make(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              onPressed: () {},
              child: "Add to Cart".text.xl.make(),
            ).wh(130, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catelog.id.toString()),
              child: Image.network(catelog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 20,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catelog.name.text.bold.xl3
                            .color(context.accentColor)
                            .make(),
                        catelog.desc.text.lg
                            .textStyle(context.captionStyle as TextStyle)
                            .make(),
                        10.heightBox,
                        "Sanctus voluptua dolor sit ipsum vero sea vero, sadipscing duo sanctus dolore no dolor dolores diam ut, tempor sadipscing lorem lorem vero dolor clita. Ut voluptua eos et et consetetur. Amet dolore at duo invidunt dolore amet vero dolores. Accusam erat sadipscing magna voluptua diam takimata. Erat elitr ut ipsum."
                            .text
                            .textStyle(context.captionStyle as TextStyle)
                            .align(TextAlign.justify)
                            .make()
                            .p16(),
                      ],
                    ).py32(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
