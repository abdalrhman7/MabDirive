import 'package:flutter/material.dart';

class PriceBox extends StatelessWidget {
  final String price;

  const PriceBox({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        price,
        style: const TextStyle(
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
