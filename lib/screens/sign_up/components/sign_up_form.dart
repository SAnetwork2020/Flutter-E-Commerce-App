import 'package:flutter/material.dart';
import 'package:oniyeye/screens/complete_profile/complete_profile_screen.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_errors.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
  String email = "";
  String password = "";
  String confirm_password = "";
  final List<String>errors = [];

  bool isVisible = true;
  bool isPassVisible = true;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30),),
            buildPasswordFormField(isPassVisible: isPassVisible, press: () {
              setState(() {
                isPassVisible = !isPassVisible;
              });
            }),
            SizedBox(height: getProportionateScreenHeight(30),),
            buildConfFormField(press: () {
              setState(() {
                isVisible = !isVisible;
              });
            }, isVisible: isVisible),
            SizedBox(height: getProportionateScreenHeight(40),),
            FormError(errors: errors),
            DefaultButton(text: "Continue", press: (){
              print("password is:$password\nconfirm password is:$confirm_password");
              if (_formKey.currentState!.validate()){
                _formKey.currentState!.save();
              Navigator.pushNamed(context, CompleteProfile.routeName);
            }}
          )
          ],
        ),
      ),
    );
  }

  TextFormField buildConfFormField({required isVisible,required Function() press}) {
    return TextFormField(
      obscureText: isVisible,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue)=> confirm_password = newValue!,
      onChanged: (value){
        if (value.isNotEmpty){
          removeError(error: kPassNullError);
        }else if (value == password){
          removeError(error: kConfPassNullError);
        }
        confirm_password = value;
      },
      validator: (value){
        if (value!.isEmpty){
          addError(error: kConfPassNullError);
          return "";
        }if (value != password){
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration:  InputDecoration(
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right:getProportionateScreenWidth(10)),
            child: IconButton(onPressed: press,
              icon: isVisible? const Icon(Icons.visibility_off):const Icon(Icons.visibility)),
          )
      ),
    );
  }

  TextFormField buildPasswordFormField({required isPassVisible, required Function() press}) {
    return TextFormField(
      obscureText: isPassVisible,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value){
        // if (value.isNotEmpty){
        //   removeError(error:kPassNullError);
        // }else if(value.length >= 8){
        //   removeError(error: kShortPassError);
        // }
        // return "";
        password = value;
      },
      validator: (value){
        if (value!.isEmpty){
          addError(error:kPassNullError);
          return "";
        }else if(value.length < 8 ){
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right:getProportionateScreenWidth(10),
            ),
            child: IconButton(onPressed: press,
                splashRadius: 1,
                icon: isPassVisible? const Icon(Icons.visibility_off):const Icon(Icons.visibility)),
          )
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue)=>email = newValue!,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value){
        if (value.isNotEmpty){
          removeError(error: kEmailNullError);
        }else if(emailValidatorRegExp.hasMatch(value)){
          removeError(error: kInvalidEmailError);
        }return;
      },
      validator: (value){
        if (value!.isEmpty){
          addError(error: kEmailNullError);
          return "";
        }else if(!emailValidatorRegExp.hasMatch(value)){
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          hintText: "Enter your email",
          labelText: "Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: 'assets/icons/Mail.svg',)
      ),
    );
  }

}