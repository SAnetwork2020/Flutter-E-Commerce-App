import 'package:flutter/material.dart';

import '../../components/model/product.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'details_screen.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,

  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.all(8),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected? kPrimaryColor : Colors.transparent)
        // color: product.colors[0]
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
      ),
    );
  }
}

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // int SelectedColor = 3;
    return Row(
      children: [
        ...List.generate(product.colors.length, (index) => ColorDot(color: product.colors[index])),
        const Spacer(),
        RoundedIconBtn(iconData: Icons.remove, press: (){}),
        SizedBox(width: getProportionateScreenWidth(15),),
        RoundedIconBtn(iconData: Icons.add, press: (){}),
      ],
    );
  }
}