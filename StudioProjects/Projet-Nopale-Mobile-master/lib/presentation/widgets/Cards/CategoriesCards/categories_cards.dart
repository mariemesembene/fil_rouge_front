import 'package:flutter/material.dart';

enum TransactionCategories {
  alimentation,
  shopping,
  transport,
  sport,
  assurance,
  recharger,
  transferer,
  autre,
}

class CategoriesCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final TransactionCategories category;

  const CategoriesCard(
      {Key? key,
      required this.category,
      required this.icon,
      required this.iconColor,
      required this.bgColor})
      : super(key: key);

  TransactionCategories get categoryTransaction => category;

  @override
  _CategoriesCardState createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 40,
      height: 40,
      child:
          Center(child: Icon(widget.icon, size: 20.0, color: widget.iconColor)),
    );
  }
}
