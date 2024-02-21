import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_test/feature/favourites_page/presentation/cubit/favourites_cubit.dart';
import 'package:market_test/feature/market_page/domain/entity/coin_entity.dart';

class FavoriteIconWidget extends StatelessWidget {
  const FavoriteIconWidget({
    super.key,
    required this.coin,
  });

  final CoinEntity coin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        bool isFavorite = state.coinList.any((e) => coin.id == e.id);

        return CupertinoButton(
          onPressed: () {
            if (isFavorite) {
              context.read<FavouritesCubit>().removeCoin(coin);
              return;
            }
            context.read<FavouritesCubit>().saveCoin(coin);
            return;
          },
          padding: EdgeInsets.zero,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isFavorite ? const Icon(Icons.star) : const Icon(Icons.star_border_outlined),
          ),
        );
      },
    );
  }
}
