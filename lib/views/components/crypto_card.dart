import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Expanded CryptoCard(String text, String value, String selectedCurrency) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 18.0, 18.0, 20.0),
      child: Card(
        color: const Color(0x54579ed9),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Center(
            child: Text(
              '1 $text = $value $selectedCurrency',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
