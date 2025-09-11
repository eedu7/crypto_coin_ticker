import 'package:flutter/material.dart';

class CoinInfo extends StatefulWidget {
  final String symbol;
  final String symbolColor;
  final String rate;
  final String name;

  const CoinInfo({
    super.key,
    required this.symbol,
    required this.symbolColor,
    required this.rate,
    required this.name,
  });

  @override
  State<CoinInfo> createState() => _CoinInfoState();
}

class _CoinInfoState extends State<CoinInfo> {
  Color hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 12.0,
      children: <Widget>[
        Text(
          '\$ ${widget.rate}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        ),
        Text(
          '${widget.symbol} ${widget.name}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: hexToColor(widget.symbolColor),
          ),
        ),
      ],
    );
  }
}
