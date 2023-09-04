import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';
import 'package:flutter/material.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key}) : super(key: key);

  @override
  State<CryptoListScreen> createState() => _CryptoCurrencyListState();
}

class _CryptoCurrencyListState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crypto Currencies List',
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 20,
        itemBuilder: (context, i) {
          const coinName = 'BitCoin';
          return const CryptoCoinTile(coinName: coinName);
        },
      ),
    );
  }
}


