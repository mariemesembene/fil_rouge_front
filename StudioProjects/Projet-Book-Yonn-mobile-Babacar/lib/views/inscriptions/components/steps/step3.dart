import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/form/custom_text_form_field.dart';
import 'package:book_yonn_mobile/views/inscriptions/inscriptions_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';

GlobalKey<FormState> keyFormStep3 = GlobalKey<FormState>();

_Step3State? step3state;

class Step3 extends StatefulWidget {
  const Step3({Key? key}) : super(key: key);

  @override
  _Step3State createState() => step3state = _Step3State();
}

class _Step3State extends State<Step3> {
  bool isSwitch0n = false;
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyFormStep3,
      child: Column(
        children: [
          CustomTextFormField(
              label: 'Email',
              type: TextInputType.emailAddress,
              controller: inscriptionsFormState!.emailController,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(passwordFocus);
              },
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  return '\u26A0 Ce champs est obligatoire';
                }
                if (!EmailValidator.validate(value)) {
                  return '\u26A0 L\'email est incorrect';
                }
              }),
          SizedBox(
            height: 37,
          ),
          CustomTextFormField(
              label: 'Mot de passe',
              type: TextInputType.visiblePassword,
              controller: inscriptionsFormState!.passwordController,
              obscureText: true,
              focusNode: passwordFocus,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(confirmPasswordFocus);
              },
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  return '\u26A0 Ce champs est obligatoire';
                }
                if (value.length < 8) {
                  return '\u26A0 Au moins 8 caractères';
                }
              }),
          SizedBox(
            height: 37,
          ),
          CustomTextFormField(
              label: 'Confirmer mot de passe',
              type: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              controller: inscriptionsFormState!.confirmPasswordController,
              focusNode: confirmPasswordFocus,
              obscureText: true,
              onFieldSubmitted: (_) {
                inscriptionsFormState?.nextStep();
              },
              validator: (value) {
                if (value.isEmpty) {
                  return '\u26A0 Ce champs est obligatoire';
                }
                if (inscriptionsFormState!.passwordController.text !=
                    value.toString()) {
                  print(inscriptionsFormState!.passwordController.value);
                  print(value);
                  return '\u26A0 Mot de passe incorrect';
                }
                return null;
              }),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              FlutterSwitch(
                  inactiveColor: colorGray,
                  value: isSwitch0n,
                  onToggle: (value) {
                    setState(() {
                      isSwitch0n = true;
                    });
                  }),
              SizedBox(
                width: 15,
              ),
              RichText(
                  text: TextSpan(
                      text: 'j\'accepte tous les ',
                      style: TextStyle(
                          color: colorDarkGray,
                          fontFamily: 'SF Pro Display Regular',
                          fontSize: 18),
                      children: [
                    TextSpan(
                        text: 'termes, ',
                        style: TextStyle(
                            fontFamily: 'SF Pro Display Regular',
                            fontWeight: FontWeight.bold,
                            color: colorBlue,
                            fontSize: 18)),
                    TextSpan(
                        text: '\nla ',
                        style: TextStyle(
                            color: colorDarkGray,
                            fontFamily: 'SF Pro Display Regular',
                            fontSize: 18)),
                    TextSpan(
                        text: 'politique de confidentialité',
                        style: TextStyle(
                            fontFamily: 'SF Pro Display Regular',
                            fontWeight: FontWeight.bold,
                            color: colorBlue,
                            fontSize: 18))
                  ])),
            ],
          )
        ],
      ),
    );
  }
}
