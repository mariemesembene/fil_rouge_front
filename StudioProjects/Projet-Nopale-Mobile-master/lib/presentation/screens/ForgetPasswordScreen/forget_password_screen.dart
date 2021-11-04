import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/presentation/screens/ForgetPasswordScreen/components/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mot de passe oublié'),
      ),
      body: const Body(),
    );
  }
}
