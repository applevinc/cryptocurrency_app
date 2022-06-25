import 'package:flutter/material.dart';

class Wallet {
  final int balance;
  final List<Color> colors;
  final String currency;

  Wallet({
    required this.balance,
    required this.colors,
    required this.currency,
  });
}
