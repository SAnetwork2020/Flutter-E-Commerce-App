import 'package:flutter/material.dart';
import 'package:oniyeye/components/default_button.dart';
import 'package:oniyeye/screens/details/product_description.dart';
import 'package:oniyeye/screens/details/product_images.dart';
import 'package:oniyeye/screens/details/top_rounded_container.dart';
import 'package:oniyeye/size_config.dart';

import '../../components/model/product.dart';
import 'color_dots.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(product: product, pressOnSeeMore: () {  },),
                TopRoundedContainer(
                    color: const Color(0xfff6f7f9),
                    child: Column(
                      children: [
                        ColorDots(product: product),
                        TopRoundedContainer(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth! * 0.15,
                              right: SizeConfig.screenWidth! * 0.15,
                              top: getProportionateScreenWidth(15),
                              bottom: getProportionateScreenWidth(40),
                            ),
                            child: DefaultButton(text: "Add to Cart",
                                press: (){}),
                          ),
                        )
                      ],
                    )
                )
              ],
            ),)
        ],
      ),
    );
  }
}









