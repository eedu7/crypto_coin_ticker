import 'dart:convert';

import 'package:crypto_coin_ticker/models/crypto_coin.dart';
import 'package:http/http.dart' as http;

class CryptoDataApi {
  Future<CryptoCoin> getData({
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

    return CryptoCoin.fromJson(jsonDecode(response.body));
  }
}
