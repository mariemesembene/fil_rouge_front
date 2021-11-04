import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/presentation/screens/SignInScreen/components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: const Body(),
    );
  }
}
