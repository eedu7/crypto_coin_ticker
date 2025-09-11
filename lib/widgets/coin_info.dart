import 'package:crypto_coin_ticker/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CoinInfo extends StatefulWidget {
  final CryptoCoin coin;

  const CoinInfo({super.key, required this.coin});

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
          '\$ ${widget.coin.rate}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        ),
        Text(
          '${widget.coin.symbol} ${widget.coin.name}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: hexToColor(widget.coin.symbolColor),
          ),
        ),
      ],
    );
  }
}
