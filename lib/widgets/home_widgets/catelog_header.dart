import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catelog App".text.xl5.bold.color(MyThemes.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
