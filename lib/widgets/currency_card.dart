import 'package:flutter/material.dart';

class CurrencyCard extends StatefulWidget {
  const CurrencyCard({super.key});

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
          child: Column(
            children: <Widget>[
              Text(
                "756",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              Text(
                "EUR/USD",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
