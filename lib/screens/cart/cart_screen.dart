import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oniyeye/components/default_button.dart';
import 'package:oniyeye/constants.dart';
import 'package:oniyeye/size_config.dart';

import '../../components/cart.dart';
import '../cart/components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/Cart Screen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildAppBar(context),
      ),
      body: const Body(),
      bottomNavigationBar: const CheckBarCard(),
    );
  }

  Column buildAppBar(BuildContext context) {
    return Column(
        children: [
          const Text(
            "Your Cart",
            style:  TextStyle(
              color: Colors.black),
          ),
          Text(
            "${demoCarts.length} items",
            style:  Theme.of(context).textTheme.bodySmall
          ),
        ],
      );
  }
}

class CheckBarCard extends StatelessWidget {
  const CheckBarCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
        vertical: getProportionateScreenWidth(30),
      ),
      // height: 174,
        decoration: BoxDecoration(
          color: Colors.white, boxShadow: [
            BoxShadow(
              offset: const Offset(0,-15), blurRadius: 20,
              color: const Color(0xffdadada).withOpacity(.15)
            )
        ]
        ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xfff5f6f9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                const Text('Add voucher code'),
                const SizedBox(width: 10,),
                const Icon(Icons.arrow_forward_ios, size: 12, color: kTextColor,),
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(20),),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(text: "Total:\n",
                  children: [
                    TextSpan(
                      text: "\$337.15", style: TextStyle(fontSize: 16, color: Colors.black)
                    )
                  ]),
                ),
                SizedBox(width: getProportionateScreenWidth(190),
                child: DefaultButton(text: "Check Out", press: (){}),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
