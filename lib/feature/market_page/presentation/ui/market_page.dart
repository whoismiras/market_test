import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_test/feature/market_page/presentation/cubit/market_cubit.dart';
import 'package:market_test/feature/market_page/presentation/ui/widget/coin_item_widget.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketCubit()..getCoinList(),
      child: BlocBuilder<MarketCubit, MarketCommonState>(
        builder: (context, state) {
          if( state.isLoading == false){
            return Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,

              ),
              child: ListView.builder(
                itemCount: state.coinList.length,
                itemBuilder: (context, index) {
                  final item = state.coinList.elementAt(index);

                    Container(
                      child: CoinItemWidget(
                        icon: item.iconUrl,
                        name: item.name,
                        price: item.price,


                      ),
                    );},),

            );
          }
          return const SizedBox();

        },
      ),
    );
  }
}
