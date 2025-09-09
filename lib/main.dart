import 'package:flutter/material.dart';

void main() {
  runApp(CryptoCoinTicker());
}

class CryptoCoinTicker extends StatelessWidget {
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
        padding: EdgeInsetsGeometry.all(8.0),
        child: Column(
          spacing: 18.0,
          children: <Widget>[
            Expanded(child: Container(color: Colors.black12)),
            Text(
              "Currency Exchange",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 12.0,
              children: <Widget>[
                Expanded(
                  child: Container(height: 120.0, color: Colors.black12),
                ),
                Expanded(
                  child: Container(height: 120.0, color: Colors.black12),
                ),
                Expanded(
                  child: Container(height: 120.0, color: Colors.black12),
                ),
              ],
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
