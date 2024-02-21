import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_test/core/widgets/app_divider_widget.dart';
import 'package:market_test/feature/favourites_page/presentation/cubit/favourites_cubit.dart';
import 'package:market_test/feature/market_page/domain/entity/coin_entity.dart';
import 'package:market_test/feature/market_page/presentation/cubit/market_cubit.dart';
import 'package:market_test/feature/market_page/presentation/ui/widget/coin_item_widget.dart';

class MarketPage extends StatelessWidget {
  MarketPage({super.key});

  final _cubit = FavouritesCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketCommonState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SizedBox();
        }
        List<CoinEntity> items = List<CoinEntity>.from(state.searchResults);
        if (state.searchResults.isEmpty) {
          items.addAll(state.coinList);
        }
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              context.read<MarketCubit>().getCoinList();
            },
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) => const AppCommonDividerWidget(),
              itemBuilder: (context, index) {
                final item = items.elementAt(index);
                return CoinItemWidget(
                  onTap: () {},
                  coin: item,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
