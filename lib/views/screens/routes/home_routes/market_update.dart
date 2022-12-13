import 'package:flutter/material.dart';
import 'package:paypee/shared/components/textstyles.dart';
import 'package:paypee/shared/constants/colors.dart';
import 'package:paypee/views/widgets/marketList/cryptoList.dart';

class MarketUpdate extends StatefulWidget {
  const MarketUpdate({Key? key}) : super(key: key);

  @override
  State<MarketUpdate> createState() => _MarketUpdateState();
}

class _MarketUpdateState extends State<MarketUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: background,
    appBar: PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Container(
    decoration: const BoxDecoration(
    boxShadow: [
    BoxShadow(
    offset: Offset(0, 0.4,),
    blurRadius: 0,
    color: faint4
    )
    ]
    ),
    child: AppBar(
    elevation: 0.0,
    backgroundColor: background,
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: Padding(
    padding: const EdgeInsets.only(right: 10, left: 20),
    child: GestureDetector(
    onTap: () {
    Navigator.of(context).pop();
    },
    child: SizedBox(
    height: 25,
    width: 25,
    child: Image.asset('assets/images/return.png')),
    ),
    ),
    title: Text('Market Update',
    style: appbar.copyWith(fontSize: 16)
    ),)),
    ),
    body: SafeArea(
      child: DefaultTabController(
        length: 2,child: Column(
          children: [
             Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset(
                      0,
                      0.4,
                    ),
                    blurRadius: 0,
                    color: faint4)
              ], color: background),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                      height: 45,
                      width: 147,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1, color: faint4),
                        color: faint2
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                        child: TabBar(
                          indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: faint4, width: 1),
                                color: background,
                              ),
                              labelColor: textColor100,
                              labelPadding: const EdgeInsets.all(4.6),
                              unselectedLabelColor: textColor60,
                              labelStyle: const TextStyle(
                                  fontFamily: 'Mabry-Pro',
                                  fontSize: 12,
                                  color: textColor100,
                                  fontWeight: FontWeight.w500),
                              indicatorSize: TabBarIndicatorSize.tab,
                          tabs: const[
                            Tab(child: Text('Crypto',)),
                             Tab(child: Text('Forex')),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
             ),
             const Expanded(
              flex: 1,
               child: TabBarView(children: [
               Padding(
                 padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                 child: CryptoCard(),
               ),
                Center(child: Text('No data yet', style: medium16,))
               ]),
             )
            
          ],
        ),),
      ),
    );
  }
}
