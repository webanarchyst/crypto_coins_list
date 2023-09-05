import 'package:crypto_coins_list/repositories/models/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,XRP,MATIC&tsyms=USD,EUR');
    //debugPrint(response.toString());
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'];
      final price = usdData['PRICE'];
      final imgUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        iconCoin: 'https://cryptocompare.com/$imgUrl',
      );
    }).toList();
    return cryptoCoinList;
  }
}
