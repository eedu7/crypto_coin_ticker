import 'package:crypto_coin_ticker/services/crypto_data_api.dart';
import 'package:flutter/material.dart';

const List<String> coins = <String>["BTC", "ETH"];

class CoinsDropdown extends StatefulWidget {
  final Function(Map<String, String>) onCoinSelected;

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
        Map<String, String> data = await cryptoDataApi.getData(code: value!);
        widget.onCoinSelected(data);
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
