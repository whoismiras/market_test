import 'package:flutter/material.dart';
import 'package:market_test/feature/main_page/presentation/ui/launch_page.dart';
import 'package:market_test/core/utils/di_locator.dart' as di_locator;

Future<void> main() async {
  Widget screen = const LaunchPage();
  await di_locator.initLocator();
  runApp( MarketTest(screen: screen));
}

class MarketTest extends StatelessWidget {
  const MarketTest({super.key, required this.screen,});
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  screen,

    );
  }
}
