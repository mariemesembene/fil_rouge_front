import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/connexion/components/form/custom_text_form_field.dart';
import 'package:book_yonn_mobile/views/connexion/components/modal/modal_color_car.dart';
import 'package:flutter/material.dart';

class Step5 extends StatefulWidget {
  const Step5({Key? key}) : super(key: key);

  @override
  _Step5State createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            label: 'Numéro de permis', suffixIcon: Icon(Icons.info_outline)),
        SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.5),
            child: Row(
              children: [
                Icon(
                  Icons.document_scanner_outlined,
                  size: 30,
                  color: colorBlue,
                ),
                SizedBox(
                  width: 14.7,
                ),
                Text(
                  'Scanner mon permis',
                  style: TextStyle(
                      color: colorBlue,
                      fontFamily: 'Circular Std Bold',
                      fontSize: 18),
                )
              ],
            ),
          ),
        ),
        CustomTextFormField(
            label: 'Numéro de serie de la voiture',
            suffixIcon: Icon(Icons.info_outline)),
        SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.5),
            child: GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (_) => ModalColorCar());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.palette_outlined,
                    size: 30,
                    color: colorBlue,
                  ),
                  SizedBox(
                    width: 14.7,
                  ),
                  Text(
                    'Ma couleur de voiture',
                    style: TextStyle(
                        color: colorBlue,
                        fontFamily: 'Circular Std Bold',
                        fontSize: 18),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  CircleAvatar(
                    radius: 9,
                    backgroundColor: colorRed,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  
}
