import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/ErrorMessages/error_message.dart';
import 'package:projet_nopale_mobile/constants/SizeConfig/size_config.dart';
import 'package:projet_nopale_mobile/presentation/screens/SignUpScreen/components/body.dart';

GlobalKey<FormState> keyFormStep1 = GlobalKey<FormState>();

class SignUpStep1 extends StatefulWidget {
  const SignUpStep1({Key? key}) : super(key: key);

  @override
  _SignUpStep1State createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1> {
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode telephoneFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyFormStep1,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Expanded(
                child: CountryCodePicker(
                  onChanged: print,
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'SN',
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
              ),
              Expanded(
                child: buildTelephoneFormField(),
                flex: 2,
              ),
            ],
          )
        ],
      ),
    );
  }

  buildFirstNameFormField() {
    return TextFormField(
      focusNode: firstNameFocus,
      onFieldSubmitted: (_) => Focus.of(context).requestFocus(lastNameFocus),
      controller: bodyState!.firstNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return errorNullMessage;
        }
        return null;
      },
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.person_outlined),
        labelText: "Prénom",
        hintText: "Entrez votre prénom",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  buildLastNameFormField() {
    return TextFormField(
      focusNode: lastNameFocus,
      onFieldSubmitted: (_) => Focus.of(context).requestFocus(emailFocus),
      controller: bodyState!.lastNameController,
      validator: (value) {
        if (value!.isEmpty) {
          return errorNullMessage;
        }
        return null;
      },
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.person_outlined),
        labelText: "Nom",
        hintText: "Entrez votre nom",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  buildEmailFormField() {
    return TextFormField(
      focusNode: emailFocus,
      onFieldSubmitted: (_) => Focus.of(context).requestFocus(telephoneFocus),
      controller: bodyState!.emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return errorNullMessage;
        } else if (emailValidatorRegExp.hasMatch(value)) {
          return errorInvalidEmailMessage;
        }
        return null;
      },
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.email_outlined),
        labelText: "Adresse Email",
        hintText: "Entrez votre email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildTelephoneFormField() {
    return TextFormField(
      focusNode: telephoneFocus,
      onFieldSubmitted: (_) => bodyState!.switchNextStep(),
      controller: bodyState!.telephoneController,
      validator: (value) {
        if (value!.isEmpty) {
          return errorNullMessage;
        }
        return null;
      },
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.phone_outlined),
        labelText: "Téléphone",
        hintText: "Entrez votre tel.",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
