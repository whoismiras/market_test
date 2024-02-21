import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_test/core/config/theme.dart';
import 'package:market_test/feature/favourites_page/presentation/ui/favorite_icon_widget.dart';
import 'package:market_test/feature/market_page/domain/entity/coin_entity.dart';

/// row widget with detailed information for specific coin
class CoinItemWidget extends StatelessWidget {
  const CoinItemWidget({
    super.key,
    required this.coin,
    required this.onTap,
  });

  final CoinEntity coin;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: <Widget>[
          SvgPicture.network(
            coin.iconUrl,
            height: 50,
            fit: BoxFit.contain,
            placeholderBuilder: (_) {
              return const Icon(
                Icons.circle_outlined,
                size: 32,
                color: AppColors.primary,
              );
            },
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              coin.name,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            child: Text(
              coin.price,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(width: 12.0),
          FavoriteIconWidget(coin: coin),
        ],
      ),
    );
  }
}
