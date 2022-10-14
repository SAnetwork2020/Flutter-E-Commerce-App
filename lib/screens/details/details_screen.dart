import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oniyeye/components/model/product.dart';
import 'package:oniyeye/size_config.dart';

import '../details/body.dart';
import 'components/custom_app_bar.dart';


class DetailScreen extends StatelessWidget {
  static String routeName = "/Detail Screen";
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments = ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: const Color(0xfff5f6f9),
      appBar: CustomAppBar(rating: arguments.product.rating),
      body: Body(product: arguments.product,),
    );
  }
}


class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key? key, required this.iconData, required this.press,
  }) : super(key: key);
final IconData iconData;
final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
            elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          )
        ), onPressed: press, child: Icon(iconData, color: Colors.black,),
      ),
    );
  }
}
class ProductDetailsArguments{
  final Product product;
  ProductDetailsArguments({required this.product});
}