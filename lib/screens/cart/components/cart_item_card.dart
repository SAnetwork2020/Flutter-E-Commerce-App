import 'package:flutter/material.dart';

import '../../../components/cart.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key, required this.cart,
  }) : super(key: key);
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xfff5f6f9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0]),
            ),

          ),
        ),
        SizedBox(width: getProportionateScreenWidth(20),),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cart.product.title,maxLines: 2,
              style: const TextStyle(
                fontSize: 16, color: Colors.black,
              ),),
            const SizedBox(height: 10,),
            Text.rich(
              TextSpan(text: "\$${cart.product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor
                  ),
                  children: [
                    TextSpan(text: " x${cart.numOfItems}",
                        style: const TextStyle(color: kTextColor)
                    )
                  ]
              ),
            )
          ],
        )
      ],
    );
  }
}
