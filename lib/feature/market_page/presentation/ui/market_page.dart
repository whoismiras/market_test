import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_test/core/widgets/app_divider_widget.dart';
import 'package:market_test/feature/favourites_page/presentation/cubit/favourites_cubit.dart';
import 'package:market_test/feature/market_page/presentation/cubit/market_cubit.dart';
import 'package:market_test/feature/market_page/presentation/ui/widget/coin_item_widget.dart';

class MarketBuilder extends StatelessWidget {
  const MarketBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MarketCubit>(
        create: (_) => MarketCubit()..getCoinList(),
      ),
      BlocProvider<FavouritesCubit>(
        create: (_) => FavouritesCubit(),
      ),
    ], child: MarketPage());
  }
}

class MarketPage extends StatelessWidget {
  MarketPage({super.key});

  final _cubit = FavouritesCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketCommonState>(
      builder: (context, state) {
        if (state.isLoading == false) {
          return Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: ListView.separated(
              itemCount: state.coinList.length,
              separatorBuilder: (context, index) => const AppCommonDividerWidget(),
              itemBuilder: (context, index) {
                final item = state.coinList.elementAt(index);
                return CoinItemWidget(
                  onTap: () => _cubit.saveCoin(item),
                  icon: item.iconUrl,
                  name: item.name,
                  price: item.price,
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
