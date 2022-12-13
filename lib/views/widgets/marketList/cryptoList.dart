import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paypee/models/crypto_model.dart';
import 'package:paypee/models/marketPrice.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:http/http.dart' as http;

class CryptoCard extends StatefulWidget {
  const CryptoCard({Key? key}) : super(key: key);

  @override
  State<CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  List<CryptoModel> cryptolist = [
    CryptoModel(
        imageUrl: 'assets/images/tether.png',
        name: 'Tether',
        price: 0,
        symbol: 'USDT',
        percentageChange: 0.00),
    CryptoModel(
        imageUrl: 'assets/images/bitlist.png',
        name: 'Bitcoin',
        price: 0,
        symbol: 'USDT',
        percentageChange: 1.00),
    CryptoModel(
        imageUrl: 'assets/images/ethereum.png',
        name: 'Ethereum',
        price: 0,
        symbol: 'ETH',
        percentageChange: 1.00),
    CryptoModel(
        imageUrl: 'assets/images/compound.png',
        name: 'Compound',
        price: 0,
        symbol: 'COMP',
        percentageChange: 1.00),
    CryptoModel(
        imageUrl: 'assets/images/tron.png',
        name: 'Tron',
        price: 0,
        symbol: 'MATIC',
        percentageChange: 1.00),
    CryptoModel(
        imageUrl: 'assets/images/polygon.png',
        name: 'Polygon',
        price: 0,
        symbol: 'TRX',
        percentageChange: 1.00),
    CryptoModel(
        imageUrl: 'assets/images/near.png',
        name: 'Near Protocol',
        price: 0,
        symbol: 'Near',
        percentageChange: 1.00),
    CryptoModel(
        imageUrl: 'assets/images/apecoin.png',
        name: 'Apecoin',
        price: 0,
        symbol: 'APE',
        percentageChange: 1.00),
    CryptoModel(
        imageUrl: 'assets/images/tron.png',
        name: 'Terra',
        price: 0,
        symbol: 'LUNA',
        percentageChange: 1.00),
  ];
  List<CoinPrice>? coinPrices;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    try {
      var url = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=200&page=1&sparkline=false');
      var response = await http.get(url);
      setState(() {
        coinPrices = coinPriceFromJson(response.body);
      });
    } catch (error) {
      print('An api error has occured $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          mainAxisExtent: 135,
        ),
        itemCount: cryptolist.length,
        itemBuilder: ((context, index) {
          final match = coinPrices?.where(
            (element) =>
                element.name.toUpperCase() ==
                cryptolist[index].name.toUpperCase(),
          );

          final actualPrice =
              match?.isNotEmpty == true ? match!.first.currentPrice : 0;

          final percentage =
              match?.isNotEmpty == true ? match!.first.priceChange24H : 0;
          return Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: faint3),
                borderRadius: BorderRadius.circular(5),
                color: background),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(cryptolist[index].imageUrl),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    cryptolist[index].name,
                    style: label.copyWith(color: textColor80),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    NumberFormat.simpleCurrency(locale: 'en_US')
                        .format(actualPrice),
                    style: appbar.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    percentage.toDouble() < 0
                        ? '${percentage.toDouble().toStringAsFixed(2)}%'
                        : '+${percentage.toDouble().toStringAsFixed(2)}%',
                    style: TextStyle(
                        fontFamily: 'Mabry-Pro',
                        fontSize: 12,
                        color: percentage > 0 ? green100 : red100,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
