import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/ErrorMessages/error_message.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';

import 'body.dart';

GlobalKey<FormState> keyFormStep2 = GlobalKey<FormState>();

class SignUpStep2 extends StatefulWidget {
  const SignUpStep2({Key? key}) : super(key: key);

  @override
  _SignUpStep2State createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyFormStep2,
      child: Column(
        children: [
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPasswordFormField(),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      focusNode: passwordFocus,
      onFieldSubmitted: (_) => Focus.of(context).requestFocus(confirmPasswordFocus),
      obscureText: true,
      controller: bodyState!.passwordController,
      validator: (value) {
        if (value!.isEmpty) {
          return errorNullMessage;
        } else if (value.length < 8) {
          return errorSmallPassword;
        }
        return null;
      },
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.lock_outlined),
        labelText: "Mot de passe",
        // hintText: "Entrez votre mot de passe",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      focusNode: confirmPasswordFocus,
      onFieldSubmitted: (_) => bodyState!.switchNextStep(),
      obscureText: true,
      controller: bodyState!.confirmPasswordController,
      validator: (value) {
        if (value!.isEmpty) {
          return errorNullMessage;
        } else if (value != bodyState!.passwordController.text) {
          return errorInvalidMatchPassword;
        }
        return null;
      },
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.lock_outlined),
        labelText: "Confirmer mot de passe",
        // hintText: "Entrez votre mot de passe",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
