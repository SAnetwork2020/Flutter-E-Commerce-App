import 'package:flutter/material.dart';
import 'package:oniyeye/screens/details/details_screen.dart';
import 'package:oniyeye/screens/home_screen/components/product_card.dart';
import 'package:oniyeye/screens/home_screen/components/section_title.dart';

import '../../../components/model/product.dart';
import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: "Popular Product", press: (){},
        ),
        SizedBox(height: getProportionateScreenWidth(20),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(demoProducts.length, (index) => ProductCard(
                product: demoProducts[index],
                press: ()=> Navigator.pushNamed(context, DetailScreen.routeName,
                    arguments: ProductDetailsArguments(product: demoProducts[index]) ),))
            ],
          ),
        ),
      ],
    );
  }
}