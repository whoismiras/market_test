import 'package:flutter/material.dart';
import 'package:market_test/core/config/theme.dart';
import 'package:market_test/feature/favourites_page/presentation/ui/favourites_page.dart';
import 'package:market_test/feature/main_page/presentation/ui/widgets/main_page_tabbar.dart';
import 'package:market_test/feature/search/presentation/ui/search_widget.dart';
import 'package:market_test/feature/market_page/presentation/ui/market_page.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: const SearchWidget(),
      ),
      body: Column(
        children: [
          MainPageTabBar(controller: _tabController),
          Expanded(
            child: TabBarView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                MarketBuilder(),
                FavouritesPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
