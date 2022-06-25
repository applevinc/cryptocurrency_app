import 'package:flutter/material.dart';

class Crypto {
  final String name;
  final String abbreviation;
  final String icon;
  final String graph;
  final double amount;
  final double amountInUSD;
  final double percent;
  final Color color;

  Crypto({
    required this.name,
    required this.abbreviation,
    required this.icon,
    required this.graph,
    required this.amount,
    required this.amountInUSD,
    required this.percent,
    required this.color,
  });
}
