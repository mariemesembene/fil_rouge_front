import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';
class ButtonSocialInscription extends StatefulWidget {

  final String text;
  
  const ButtonSocialInscription({ Key? key, required this.text }) : super(key: key);
  @override
  _ButtonSocialInscriptionState createState() => _ButtonSocialInscriptionState();
}

class _ButtonSocialInscriptionState extends State<ButtonSocialInscription> {
  @override
  Widget build(BuildContext context) {
    return Container(
                      width: 70,
                      height: 70,
                      child: TextButton(
                        child: Image(
                          image: AssetImage(widget.text),
                          width: 27,
                          height: 27,
                        ),
                        onPressed: null,
                        style: TextButton.styleFrom(
                          backgroundColor: colorGray,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                        ),
                      ),
                    );
  }
}



