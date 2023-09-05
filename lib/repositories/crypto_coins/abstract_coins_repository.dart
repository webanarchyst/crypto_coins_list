//Опис методів
//Що приймає метод
//Шо повертає метод
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinList();
}
