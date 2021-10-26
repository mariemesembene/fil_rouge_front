import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/buttons/container_button_step.dart';
import 'package:book_yonn_mobile/views/inscriptions/components/steps/step5.dart';
import 'package:flutter/material.dart';
import 'brain_color_car.dart';

_ModalColorCarState? modalColorCarState;

class ModalColorCar extends StatefulWidget {
  const ModalColorCar({Key? key}) : super(key: key);

  @override
  _ModalColorCarState createState() =>
      modalColorCarState = _ModalColorCarState();
}

class _ModalColorCarState extends State<ModalColorCar> {
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 41.0),
      insetPadding: EdgeInsets.all(12.0),
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 0,
      content: Container(
        alignment: Alignment.center,
        width: 500,
        height: 500,
        decoration: BoxDecoration(),
        child: Center(child: BrainColorCar()),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ContainerButtonStep(
              title: 'Annuler',
              bgColor: colorGray,
              textColor: colorDarkGray,
              action: closeModalColorCar,
            ),
            ContainerButtonStep(
              title: 'Enregistrer',
              bgColor: colorBlue,
              textColor: colorWhite,
              action: saveChoosedColor,
            )
          ]),
        )
      ],
    );
  }

  void closeModalColorCar() {
    Navigator.pop(context);
  }

  void saveChoosedColor() {
    closeModalColorCar();
    step5state?.setState(() {
        step5state?.indexColorChoosed = selectedColorIndex;
    });
  }
}
