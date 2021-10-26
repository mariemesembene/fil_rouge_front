import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:book_yonn_mobile/views/connexion/components/buttons/container_button_step.dart';
import 'package:flutter/material.dart';
import 'brain_color_car.dart';

BrainColorCar brainColorCar = new BrainColorCar();

List<Row> listRows = [];

class ModalColorCar extends StatefulWidget {
  const ModalColorCar({Key? key}) : super(key: key);

  @override
  _ModalColorCarState createState() => _ModalColorCarState();
}

class _ModalColorCarState extends State<ModalColorCar> {
  @override
  Widget build(BuildContext context) {
    // print(brainColorCar.getNumberRows());

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
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
              action: closeModalColorCar,
            )
          ]),
        )
      ],
    );
  }

  void closeModalColorCar() {
    Navigator.pop(context);
  }

  void chooseColor() {}
}
