import 'package:flutter/material.dart';

class PaymentModeModel{
  final int id;
  final String title;
  final String image;
  final IconData? icon;

  const PaymentModeModel({
    required this.id,
    required this.title,
    required this.image,
    this.icon
  });
}