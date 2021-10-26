import 'package:flutter/material.dart';

class AnimatedLoader extends StatefulWidget {
  const AnimatedLoader({Key? key}) : super(key: key);

  @override
  _AnimatedLoaderState createState() => _AnimatedLoaderState();
}

class _AnimatedLoaderState extends State<AnimatedLoader>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  Tween<double> _tween = Tween(begin: 0.75, end: 2);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getCircleAvatar(12),
        SizedBox(width: 38),
        getCircleAvatar(18),
        SizedBox(width: 38),
        getCircleAvatar(12),
      ],
    );
  }
  ScaleTransition getCircleAvatar(double radius) {
  return ScaleTransition(
    scale: _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
    child: CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue,
    ),
  );
}
}


