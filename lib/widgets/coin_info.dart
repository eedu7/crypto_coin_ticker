import 'package:flutter/material.dart';

class CoinInfo extends StatefulWidget {
  const CoinInfo({super.key});

  @override
  State<CoinInfo> createState() => _CoinInfoState();
}

class _CoinInfoState extends State<CoinInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12.0,
      children: <Widget>[
        Text(
          '\$ 11,0546',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        ),
        Text(
          'Bitcoin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
