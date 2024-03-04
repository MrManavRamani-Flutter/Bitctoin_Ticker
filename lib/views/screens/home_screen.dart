import 'package:bitctoin_ticker/helper/coin_data.dart';
import 'package:bitctoin_ticker/views/components/crypto_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCurrency = 'USD';
  DropdownButton<String> androidDropDown() {
    List<DropdownMenuItem<String>> l = [];
    for (String current in currenciesList) {
      l.add(
        DropdownMenuItem(
          value: current,
          child: Text(current),
        ),
      );
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: l,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value as String;
          getData();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];

    for (String current in currenciesList) {
      pickerItems.add(Text(current));
    }
    return CupertinoPicker(
      backgroundColor: const Color(0xff48a9fa),
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getData();
        });
      },
      children: pickerItems,
    );
  }

  String bitcoinValue = '?';
  String ethereumValue = '?';
  String litecoinValue = '?';
  CoinData coin = CoinData();
  bool isWaitingtoFetch = false;
  Map<String, String> coinValues = {};
  void getData() async {
    try {
      isWaitingtoFetch = true;
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaitingtoFetch = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x54579ed9),
      appBar: AppBar(
        title: const Center(
          child: Text('Coin Ticker'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CryptoCard(
            'BTC',
            isWaitingtoFetch ? '?' : coinValues['BTC'] as String,
            selectedCurrency,
          ),
          CryptoCard(
            'ETH',
            isWaitingtoFetch ? '?' : coinValues['ETH'] as String,
            selectedCurrency,
          ),
          CryptoCard(
            'LTC',
            isWaitingtoFetch ? '?' : coinValues['LTC'] as String,
            selectedCurrency,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            // height: 150.0,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(13.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0x54579ed9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Scroll Down : ',
                  style: TextStyle(fontSize: 18),
                ),
                androidDropDown(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
