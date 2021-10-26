import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/connexion/components/form/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Step1 extends StatefulWidget {
  const Step1({ Key? key }) : super(key: key);

  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          CustomTextFormField(label: 'Prénom(s) et nom')
      ],
    );
  }
}