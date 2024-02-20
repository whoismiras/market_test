import 'package:flutter/material.dart';

/// row widget with detailed information for specific coin
class CoinItemWidget extends StatelessWidget {
  const CoinItemWidget({super.key, required this.icon,required this.name, required this.price, });

  final String icon;
  final String name;
  final String price;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(icon),
        Text(name),
       SizedBox(width: 50),
        Text(price),
        Icon(Icons.star_border_outlined),

      ],
    );
  }
}
