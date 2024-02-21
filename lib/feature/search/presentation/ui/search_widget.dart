import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.controller,});


  /// controller for text input
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Markets', style: TextStyle(color: Colors.white,),),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              isDense: true,

              prefixIcon: Icon(Icons.search_rounded),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              prefixIconConstraints: BoxConstraints(
                maxWidth: 40,
              ),
              hintText: 'Search Coin Pairs',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
