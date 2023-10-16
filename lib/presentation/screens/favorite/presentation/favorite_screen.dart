import 'package:FOODSTAR/colors/app_colors.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Улюблене',
                    style: TextStyle(color: Colors.white,fontSize: 24),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
