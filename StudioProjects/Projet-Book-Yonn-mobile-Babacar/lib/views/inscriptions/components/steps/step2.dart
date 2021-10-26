import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/form/custom_text_form_field.dart';
import 'package:book_yonn_mobile/views/inscriptions/inscriptions_form.dart';
import 'package:flutter/material.dart';

GlobalKey<FormState> keyFormStep2 = GlobalKey<FormState>();

class Step2 extends StatefulWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  RegExp regexNumTelSenegal =
      new RegExp(r'^(221|00221|\+221)?(77|78|75|70|76)[0-9]{7}$');
  final FocusNode addressesFocus = FocusNode();
  final FocusNode numTelFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyFormStep2,
      child: Column(
        children: [
          CustomTextFormField(
            controller: inscriptionsFormState!.dateNaissController,
            label: 'Date de naissance',
            type: TextInputType.datetime,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(addressesFocus);
            },
            suffixIcon: Icon(
              Icons.calendar_today_outlined,
              color: colorLightGray,
            ),
            readOnly: true,
            validator: (value) {
              if (value.isEmpty) {
                return '\u26A0 Ce champs est obligatoire';
              }
            },
          ),
          SizedBox(
            height: 37,
          ),
          CustomTextFormField(
            label: 'Adresse',
            controller: inscriptionsFormState!.adressController,
            focusNode: addressesFocus,
            textInputAction: TextInputAction.next,
            type: TextInputType.text,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(numTelFocus);
            },
            validator: (value) {
              if (value.isEmpty) {
                return '\u26A0 Ce champs est obligatoire';
              }
            },
          ),
          SizedBox(
            height: 37,
          ),
          CustomTextFormField(
            controller: inscriptionsFormState!.numTelController,
            label: 'Numéro de téléphone',
            type: TextInputType.text,
            focusNode: numTelFocus,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) {
              inscriptionsFormState?.nextStep();
            },
            validator: (value) {
              if (value.isEmpty) {
                return '\u26A0 Ce champs est obligatoire';
              }
              if (!regexNumTelSenegal.hasMatch(value)) {
                return '\u26A0 Ce numéro est incorrect';
              }
            },
          ),
        ],
      ),
    );
  }
}
