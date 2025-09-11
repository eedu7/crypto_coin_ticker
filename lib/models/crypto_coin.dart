class CryptoCoin {
  final String name;
  final String symbol;
  final String symbolColor;
  final String rate;

  CryptoCoin({
    required this.name,
    required this.symbol,
    required this.symbolColor,
    required this.rate,
  });

  factory CryptoCoin.fromJson(Map<String, dynamic> json) {
    return CryptoCoin(
      name: json['name'] ?? 'Unknown',
      symbol: json['symbol'] ?? 'N/A',
      symbolColor: json['color'] ?? '#000000',
      rate: json["rate"] != null
          ? (json["rate"] as num).toStringAsFixed(2)
          : "0.0",
    );
  }
}
