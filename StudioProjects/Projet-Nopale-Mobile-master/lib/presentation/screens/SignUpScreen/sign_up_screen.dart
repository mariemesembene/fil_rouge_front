import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/presentation/screens/SignUpScreen/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S\'inscrire'),
      ),
      body: const Body(),
    );
  }
}
