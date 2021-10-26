import 'package:flutter/material.dart';


class ButtonBig extends StatefulWidget {

   final String title;
   final Color bgColor;
   final Color textColor;
   final VoidCallback action;


  const ButtonBig({ Key? key, required this.title, required this.bgColor,
                    required this.textColor, required this.action}) : super(key: key);

  @override
  _ButtonBigState createState() => _ButtonBigState();
}

class _ButtonBigState extends State<ButtonBig> {
    @override
    Widget build(BuildContext context) {
      return ElevatedButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(08.0)
                      ),
                      elevation: 0,
                      backgroundColor: widget.bgColor,
                    ),
                    child: Text(
                        widget.title,
                        style: TextStyle(
                          color: widget.textColor,
                          fontFamily: 'Circular Std Bold',
                          fontSize: 18,
                          letterSpacing: 0.24,
                        )
                      ),
                    onPressed: widget.action,
                  );
  }
}