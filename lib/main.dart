import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_test/feature/favourites_page/presentation/cubit/favourites_cubit.dart';
import 'package:market_test/feature/main_page/presentation/ui/launch_page.dart';
import 'package:market_test/core/utils/di_locator.dart' as di_locator;
import 'package:market_test/feature/market_page/presentation/cubit/market_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget screen = const LaunchPage();
  await di_locator.initLocator();

  // (await SharedPreferences.getInstance()).clear();
  runApp(MarketTest(screen: screen));
}

class MarketTest extends StatelessWidget {
  const MarketTest({
    super.key,
    required this.screen,
  });

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MarketCubit>(
          lazy: false,
          create: (_) => MarketCubit()..getCoinList(),
        ),
        BlocProvider<FavouritesCubit>(
          lazy: false,
          create: (context) => FavouritesCubit()..getFavouritesList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: screen,
      ),
    );
  }
}
