import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CryptoDataApi {
  Future<Map<String, String>> getData({
    String currency = "USD",
    required String code,
    bool meta = true,
  }) async {
    Uri url = Uri.https("https://api.livecoinwatch.com", "/coins/single");
    http.Response response = await http.post(
      url,
      headers: {
        "content-type": "application/json",
        "x-api-key": dotenv.env["LIVE_COIN_WATCH_API_KEY"]!,
      },
      body: jsonEncode({"currency": currency, "code": code, "meta": meta}),
    );

    var responseBody = jsonDecode(response.body);

    String symbol = responseBody["symbol"];
    String rate = responseBody['rate'];

    return {"symbol": symbol, "rate": rate};
  }
}
