import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/model/product.dart';
import '../../constants.dart';
import '../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    required this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 5,),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: product.isFavourite? const Color(0xffffe6e6) : const Color(0xfff4f6f9)
            ),
            child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
              color: product.isFavourite? const Color(0xffff4848) : const Color(0xffdbdff4),),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64)),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(10),
          ),
          child: GestureDetector(
            onTap: pressOnSeeMore,
            child: Row(
              children: const [
                Text("See More Detail", style: TextStyle(
                    color: kPrimaryColor,fontWeight: FontWeight.w600
                ),),
                SizedBox(width: 5,),
                Icon(Icons.arrow_forward_ios, size: 12, color: kPrimaryColor,)
              ],
            ),
          ),
        )
      ],
    );
  }
}