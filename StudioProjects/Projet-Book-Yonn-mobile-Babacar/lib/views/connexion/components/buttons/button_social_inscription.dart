import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';


/// ***************
/// please don't touch this component just use
///*****************

class ButtonSocialConnexion extends StatefulWidget {

  final String text;
  final VoidCallback? onPressed;
  
  const ButtonSocialConnexion({ Key? key, required this.text, this.onPressed}) : super(key: key);
  @override
  _ButtonSocialConnexionState createState() => _ButtonSocialConnexionState();
}

class _ButtonSocialConnexionState extends State<ButtonSocialConnexion> {
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
                       onPressed: widget.onPressed , // please dont touch this !!!!!!!
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



