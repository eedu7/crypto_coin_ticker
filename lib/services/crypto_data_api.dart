import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CryptoDataApi {
  Future<Map<String, String>> getData({
    String currency = 'USD',
    required String code,
    bool meta = true,
  }) async {
    Uri url = Uri.https('api.livecoinwatch.com', '/coins/single');
    http.Response response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'x-api-key': dotenv.env['LIVE_COIN_WATCH_API_KEY']!,
      },
      body: jsonEncode({'currency': currency, 'code': code, 'meta': meta}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch data: ${response.body}');
    }

    var responseBody = jsonDecode(response.body);

    String name = responseBody['name'];
    String symbol = responseBody['symbol'];
    String symbolColor = responseBody['color'];
    String rate = (responseBody['rate'] as num).toStringAsFixed(2);

    return {
      'name': name,
      'symbol': symbol,
      'symbolColor': symbolColor,
      'rate': rate,
    };
  }
}
