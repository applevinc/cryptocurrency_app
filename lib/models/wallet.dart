import 'package:flutter/material.dart';

class Wallet {
  final int balance;
  final List<Color> colors;
  final Color shadowColor;
  final String currency;

  Wallet({
    required this.balance,
    required this.colors,
    required this.currency,
    required this.shadowColor,
  });
}
