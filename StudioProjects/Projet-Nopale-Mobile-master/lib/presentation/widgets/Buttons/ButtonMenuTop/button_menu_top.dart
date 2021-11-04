import 'package:flutter/material.dart';

class ButtonMenuTop extends StatefulWidget {
  final IconData icon;
  final String title;

  const ButtonMenuTop({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  _ButtonMenuTopState createState() => _ButtonMenuTopState();
}

class _ButtonMenuTopState extends State<ButtonMenuTop> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: const Icon(Icons.credit_card),
          onPressed: () {},
        ),
        const SizedBox(height: 5),
        Text(widget.title),
      ],
    );
  }
}
