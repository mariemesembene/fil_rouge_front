import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';


class Step4 extends StatefulWidget {
  const Step4({ Key? key }) : super(key: key);

  @override
  _Step4State createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Text(
              'Choisissez une photo de profil afin d\'être facilement reconnaissable.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.5,
                  fontSize: 17,
                  letterSpacing: 0.2,
                  color: colorLightGray,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 170),
              child: CircleAvatar(
                backgroundColor: colorGray,
                radius: 70.0,
                child: Center(
                  child: Icon(
                      Icons.add,
                      color: colorSlowGray,
                      size: 70,
                    ),
                ),
              ),
            )
        ],
      ),
    );
  }
}