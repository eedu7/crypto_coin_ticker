import 'package:crypto_coin_ticker/models/crypto_coin.dart';
import 'package:crypto_coin_ticker/services/crypto_data_api.dart';
import 'package:crypto_coin_ticker/widgets/coin_info.dart';
import 'package:crypto_coin_ticker/widgets/coins-dropdown.dart';
import 'package:crypto_coin_ticker/widgets/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CryptoCoin? coin;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    CryptoDataApi cryptoDataApi = CryptoDataApi();

    coin = await cryptoDataApi.getData(code: 'BTC');

    setState(() {
      isLoading = false;
    });
  }

  void updateCoinData(CryptoCoin newCoin) {
    setState(() {
      coin = newCoin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 18.0,
          children: <Widget>[
            Expanded(
              child: Card(
                elevation: 4.0,
                child: Center(
                  child: isLoading
                      ? CircularProgressIndicator()
                      : CoinInfo(coin: coin!),
                ),
              ),
            ),
            Text(
              'Currency',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 12.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[CurrencyCard(), CurrencyCard()],
            ),
            CoinsDropdown(onCoinSelected: updateCoinData),
          ],
        ),
      ),
    );
  }
}
