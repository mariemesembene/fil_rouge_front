import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/home');
    });
    return Stack(children: [
      Container(
          alignment: Alignment.center,
          child: const Image(
            image: AssetImage('lib/presentation/assets/images/logo/logo2.png'),
          ),
          color: greenColor),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 80),
          child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white)),
        ),
      )
    ]);
  }
}
