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
  String symbol = '\$';
  String symbolColor = '#000000';
  String rate = '1';
  String name = 'US Dollar';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    CryptoDataApi cryptoDataApi = CryptoDataApi();

    Map<String, String> data = await cryptoDataApi.getData(code: 'BTC');

    updateCoinData(data);
    isLoading = false;
  }

  void updateCoinData(Map<String, String> data) {
    setState(() {
      symbol = data['symbol']!;
      rate = data['rate']!;
      name = data['name']!;
      symbolColor = data['symbolColor']!;
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
                      : CoinInfo(
                          rate: rate,
                          symbol: symbol,
                          name: name,
                          symbolColor: symbolColor,
                        ),
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
