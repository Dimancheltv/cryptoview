import 'package:flutter/material.dart';
import 'Cryptolist.dart';

void main() => runApp(CryptoTracker());

class CryptoTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Курс криптовалют',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: CryptoList(),
    );
  }
}