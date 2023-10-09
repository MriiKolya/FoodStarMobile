import 'package:FOODSTAR/presentation/screens/menu/presentation/appbar_menu.dart';
import 'package:FOODSTAR/presentation/screens/menu/presentation/menuGrid.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const AppBarMenu(),
        ],
        body: const MenuGrid(),
      ),
    );
  }
}
