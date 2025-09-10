import 'package:crypto_coin_ticker/widgets/coin_info.dart';
import 'package:crypto_coin_ticker/widgets/coins-dropdown.dart';
import 'package:crypto_coin_ticker/widgets/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(CryptoCoinTicker());
}

final class CryptoCoinTicker extends StatelessWidget {
  const CryptoCoinTicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Home()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 18.0,
          children: <Widget>[
            Expanded(
              child: Card(elevation: 4.0, child: Center(child: CoinInfo())),
            ),
            Text(
              "Currency",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Row(
              spacing: 12.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[CurrencyCard(), CurrencyCard()],
            ),
            CoinsDropdown(),
          ],
        ),
      ),
    );
  }
}
