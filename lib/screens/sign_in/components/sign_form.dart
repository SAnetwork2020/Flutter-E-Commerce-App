import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oniyeye/screens/login_success/login_success_screen.dart';
import 'package:http/http.dart' as http;
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_errors.dart';
import '../../../components/model/user_login.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../home_screen/home_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool remember = false;
  bool isLoading = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          Row(
            children: [
              Checkbox(
                  activeColor: kPrimaryColor,
                  value: remember, onChanged: (value){
                setState(() {
                  remember = value!;
                });
              }),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, ForgotPassword.routeName);},
                  child: const Text("Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),))
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20),),
          DefaultButton(
            text: 'Sign In',
            press: (){
              postLogin(UserLogin(
                  password: password,
                  email: email));
            },
          ),
        ],
      ),);
  }

  Future<http.Response?> postLogin(UserLogin data) async {
    http.Response? postLoginResponse;
    var url = Uri.parse("https://kwilox.herokuapp.com/api/v1/user-login");
    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "*/*",
    };
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();


      try {
        postLoginResponse = await http.post(url,
            headers: requestHeaders, body: jsonEncode(data.toJson()));
        if (postLoginResponse.statusCode == 200) {
          Navigator.pushNamed(context, LoginSuccess.routeName);
          if (kDebugMode) {
            print("Response status: ${postLoginResponse.statusCode}");
            print("Response body: ${postLoginResponse.body}");
            var responseData = jsonDecode(postLoginResponse.body);
            print(responseData);
          }
        }
      } catch (e, s) {
        if (kDebugMode) {
          print(e);
          print(s);
        }
      }
      setState(() {
        isLoading = false;
      });
    }
    return postLoginResponse;
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue)=> password = newValue!,
      onChanged: (value){
        if (value.isNotEmpty){
          removeError(error:kPassNullError);
        }else if(value.length >= 8){
          removeError(error: kShortPassError);
        }
        return;
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
      decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(SvgIcon: 'assets/icons/Lock.svg',)
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

  void removeError({required String error}) {
   if(errors.contains(error)){
     setState(() {
       errors.remove(error);
     });
   }
  }

  void addError({required String error}) {
    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }
}


