import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_test/feature/favourites_page/presentation/cubit/favourites_cubit.dart';
import 'package:market_test/feature/market_page/presentation/ui/widget/coin_item_widget.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              context.read<FavouritesCubit>().getFavouritesList();
              await Future.delayed(const Duration(milliseconds: 300));
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: state.coinList.isEmpty
                  ? const Center(child: Text('List is empty'))
                  : ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemCount: state.coinList.length,
                      itemBuilder: (context, index) {
                        final item = state.coinList.elementAt(index);
                        return CoinItemWidget(
                          coin: item,
                          onTap: () {},
                        );
                      }),
            ),
          ),
        );
      },
    );
  }
}
