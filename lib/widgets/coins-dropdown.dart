import 'package:crypto_coin_ticker/models/crypto_coin.dart';
import 'package:crypto_coin_ticker/services/crypto_data_api.dart';
import 'package:flutter/material.dart';

const List<String> coins = <String>["BTC", "ETH"];

class CoinsDropdown extends StatefulWidget {
  final Function(CryptoCoin newCoin) onCoinSelected;

  const CoinsDropdown({super.key, required this.onCoinSelected});

  @override
  State<CoinsDropdown> createState() => _CoinsDropdownState();
}

class _CoinsDropdownState extends State<CoinsDropdown> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = coins.first;
    CryptoDataApi cryptoDataApi = CryptoDataApi();

    return DropdownMenu(
      width: double.infinity,
      initialSelection: dropdownValue,
      onSelected: (value) async {
        CryptoCoin newCoin = await cryptoDataApi.getData(code: value!);
        widget.onCoinSelected(newCoin);
        setState(() {
          dropdownValue = value;
        });
      },
      dropdownMenuEntries: coins.map((String value) {
        return DropdownMenuEntry(value: value, label: value);
      }).toList(),
    );
  }
}
