import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoCurrenciesListApp());
}

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesList',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 29, 29, 29),
        dividerColor: const Color.fromARGB(255, 49, 47, 47),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.amber),
          backgroundColor: Color.fromARGB(255, 29, 29, 29),
          foregroundColor: Color.fromARGB(255, 29, 29, 29),
          titleTextStyle: TextStyle(
            color: Colors.amber,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          centerTitle: true,
        ),
        textTheme: TextTheme(
            bodyMedium: const TextStyle(
              color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            labelSmall: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
      ),
      routes: {
        '/': (context) => CryptoListScreen(),
        '/coin': (context) => CryptoCoinScreen(),
      },
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({Key? key}) : super(key: key);

  @override
  State<CryptoListScreen> createState() => _CryptoCurrencyListState();
}

class _CryptoCurrencyListState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crypto Currencies List',
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: theme.dividerColor,
        ),
        itemCount: 20,
        itemBuilder: (context, i) {
          const coinName = 'BitCoin';
          return ListTile(
            leading: SvgPicture.asset(
              'assets/svg/bitcoin-sv-bsv-logo.svg',
              height: 30,
              width: 30,
            ),
            title: Text(
              coinName,
              style: theme.textTheme.bodyMedium,
            ),
            subtitle: Text(
              '20000\$',
              style: theme.textTheme.labelSmall,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed('/coin', arguments: coinName);
            },
          );
        },
      ),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    //if (args == null) {
    //  log('You must provide args');
    //  return;
    //}

    //if (args is! String) {
    //  log('You must provide String args');
    //  return;
    //}
    coinName = args as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '....'),
      ),
    );
  }
}
