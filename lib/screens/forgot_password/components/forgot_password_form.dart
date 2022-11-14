import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_errors.dart';
import '../../../components/no_account_text.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (newValue)=>email = newValue!,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value){
                if (value.isNotEmpty && errors.contains(kEmailNullError)){
                  setState(() {
                    errors.remove(kEmailNullError);
                  });
                }else if(emailValidatorRegExp.hasMatch(value) &&
                    errors.contains(kInvalidEmailError)){
                  setState(() {
                    errors.remove(kInvalidEmailError);
                  });
                }return;
              },
              validator: (value){
                if (value!.isEmpty && !errors.contains(kEmailNullError)){
                  setState(() {
                    errors.add(kEmailNullError);
                  });
                }else if(!emailValidatorRegExp.hasMatch(value) &&
                    !errors.contains(kInvalidEmailError)){
                  setState(() {
                    errors.add(kInvalidEmailError);
                  });
                }return null;
              },
              decoration: const InputDecoration(
                  hintText: "Enter your email",
                  labelText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg',)
              ),
            ),
            SizedBox(height:getProportionateScreenHeight(30)),
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            DefaultButton(text: "Continue", press: (){
              if (_formKey.currentState!.validate()){

              }
            }),
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            const NoAccountText(),
          ],
        ));
  }
}
