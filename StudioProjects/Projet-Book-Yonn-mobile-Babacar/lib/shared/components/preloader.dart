import 'dart:ui';
import 'package:flutter/material.dart';
import 'animatedLoader.dart';

class Preloader extends StatefulWidget {
  const Preloader({Key? key, animated}) : super(key: key);

  final bool animated = false;

  @override
  _PreloaderState createState() => _PreloaderState();
}

class _PreloaderState extends State<Preloader> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        // color: Colors.white.withOpacity(0.7),
        child: Center(child: AnimatedLoader()),
      ),
    );
  }
}
