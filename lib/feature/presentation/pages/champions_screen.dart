import 'package:flutter/material.dart';
import 'package:lol_champions/common/app_colors.dart';
import 'package:lol_champions/feature/presentation/widgets/champions_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star,
                color: Colors.white,
                size: 12,
              ),
              iconSize: 12,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star,
                color: Colors.white,
                size: 12,
              ),
              iconSize: 12,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.star,
                color: Colors.white,
                size: 12,
              ),
              iconSize: 12,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: ChampionsList(),
    );
  }
}
