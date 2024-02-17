import 'package:flutter/material.dart';
import 'package:market_test/core/config/theme.dart';

class MainPageTabBar extends StatelessWidget {
  const MainPageTabBar({super.key,
    required this.controller,
  });
  final TabController controller;
  @override
  Widget build(BuildContext context) {
    const isSelected = true;
    return Container(
      decoration:  BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              indicatorWeight: 0.1,
              controller: controller,
              unselectedLabelColor: Colors.white,
              unselectedLabelStyle:const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              labelStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w400,
              ),
              labelColor: isSelected ? AppColors.primary : Colors.white,
              tabs:  [
                Container(
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.auto_graph_rounded),
                      Tab(
                        text: 'All',
                      ),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.primary,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_border_outlined),

                      Tab(
                        text:'Favourites',
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
