import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/connexion/components/form/message_text_form_field.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/form/custom_text_form_field.dart';
import 'package:book_yonn_mobile/views/inscriptions/inscriptions_form.dart';
import 'package:flutter/material.dart';
import 'package:book_yonn_mobile/shared/validators/validators.dart';

GlobalKey<FormState> keyFormStep1 = GlobalKey<FormState>();

Validators validators = new Validators();

class Step1 extends StatefulWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {

    
    return Form(
      key: keyFormStep1,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bonjour, et si on se connaissez un peu mieux ?\nVeuillez renseigner votre nom et prénom.',
            style: TextStyle(
              height: 1.5,
              fontSize: 16,
              letterSpacing: 0.2,
              color: colorDarkGray,
            ),
          ),
          SizedBox(
            height: 37,
          ),
          CustomTextFormField(
            label: 'Prénom(s) et nom',
            controller: inscriptionsFormState!.firstNameController,
            type: TextInputType.text,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              inscriptionsFormState?.nextStep();
            },
            validator: (value) {
              if (value.isEmpty) {
                return '\u26A0 Ce champs est obligatoire';
              }
            },
          ),
          Visibility(
            visible: hasError,
            child: SizedBox(
              height: 37,
              child: MessageTextFormField(
                message: 'Ce champs est obligatoire',
                typeMessage: 'error',
              ),
            ),
          )
        ],
      ),
    );
  }
}
