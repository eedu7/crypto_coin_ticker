import 'package:flutter/material.dart';

const List<String> coins = <String>[
  "BTC",
  "ETH",
  "XRP",
  "SOL",
  "SUI",
  "DOGE",
  "Eigen",
];

class CoinsDropdown extends StatefulWidget {
  const CoinsDropdown({super.key});

  @override
  State<CoinsDropdown> createState() => _CoinsDropdownState();
}

class _CoinsDropdownState extends State<CoinsDropdown> {
  String dropdownValue = coins.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: double.infinity,
      initialSelection: dropdownValue,
      onSelected: (value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: coins.map((String value) {
        return DropdownMenuEntry(value: value, label: value);
      }).toList(),
    );
  }
}
