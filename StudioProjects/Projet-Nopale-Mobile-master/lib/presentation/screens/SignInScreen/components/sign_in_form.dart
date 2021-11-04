import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/ErrorMessages/error_message.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';
import 'package:projet_nopale_mobile/presentation/screens/SignUpScreen/components/body.dart';
import 'package:projet_nopale_mobile/presentation/widgets/Buttons/DefaultButton/default_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? telephone;
  String? password;
  bool? remember = false;
  final FocusNode telephoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTelephoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                  activeColor: greenColor,
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              const Text("Se souvenir de moi"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/forget_password'),
                child: const Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Se connecter',
            color: greenColor,
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, '/dashboard');
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildTelephoneFormField() {
    return TextFormField(
      onFieldSubmitted: (_){
        FocusScope.of(context).requestFocus(passwordFocus);
      },
      onSaved: (newValue) => telephone = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return errorNullMessage;
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Téléphone",
          hintText: "Entrez votre numéro",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      focusNode: passwordFocus,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value!.isEmpty) {
          return errorNullMessage;
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Mot de passe",
          hintText: "Entrez votre mot de passe",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
