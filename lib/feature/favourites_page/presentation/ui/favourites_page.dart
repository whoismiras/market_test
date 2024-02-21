import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_test/feature/favourites_page/presentation/cubit/favourites_cubit.dart';
import 'package:market_test/feature/market_page/presentation/ui/widget/coin_item_widget.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritesCubit()..getFavouritesList(),
      child: BlocBuilder<FavouritesCubit, FavouritesInitial>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey,
            ),
            child: ListView.builder(
                itemCount: state.coinList.length,
                itemBuilder: (context, index) {
                  final item = state.coinList.elementAt(index);
                  return CoinItemWidget(
                    icon: item.iconUrl,
                    name: item.name,
                    price: item.price,
                    onTap: () {},
                  );
                }),
          );
        },
      ),
    );
  }
}
