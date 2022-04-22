import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime time;

  Transaction({
    this.id,
    this.title,
    this.amount,
    this.time,
  });
}
