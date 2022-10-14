import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_errors.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../otp/otp_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }
  final _formKey = GlobalKey<FormState>();

  String address = "";
  String phoneNumber = "";
  String firstName = "";
  String lastName = "";
  final List<String>errors = [];

  bool isVisible = true;
  bool isPassVisible = true;


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildAddressFormField(),
          FormError(errors: errors,),
          SizedBox(height: getProportionateScreenHeight(40),),
          DefaultButton(text: 'Continue', press: () {
            if(_formKey.currentState!.validate()){
              Navigator.pushNamed(context, OtpScreen.routeName);
            }
          },)

        ],)
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue)=>address = newValue!,
      onChanged: (value){
        if (value.isNotEmpty){
          removeError(error: kAddressNullError);
        }
        return;
      },
      validator: (value){
        if (value!.isEmpty){
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          hintText: "Enter your Address",
          labelText: "Address",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: 'assets/icons/Location point.svg',)
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      onSaved: (newValue)=>phoneNumber = newValue!,
      keyboardType: const TextInputType.numberWithOptions(),
      onChanged: (value){
        if (value.isNotEmpty){
          removeError(error: kPhoneNumberNullError);
        }
        return;
      },
      validator: (value){
        if (value!.isEmpty){
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          hintText: "Enter your Phone number",
          labelText: "Phone number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: 'assets/icons/Phone.svg',)
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue)=>lastName = newValue!,
      decoration: const InputDecoration(
          hintText: "Enter your Last Name",
          labelText: "Last Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: 'assets/icons/User.svg',)
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue)=>firstName = newValue!,
      onChanged: (value){
        if (value.isNotEmpty){
          removeError(error: kNameNullError);
        }
        return;
      },
      validator: (value){
        if (value!.isEmpty){
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          hintText: "Enter your First Name",
          labelText: "First Name",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: 'assets/icons/User.svg',)
      ),
    );
  }
}
