import 'package:flutter/material.dart';
import 'package:num_game/common/my_snackbar.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          children:  [
            for (int i = 0; i < 10; i++)...{
              
            }
           
          ],
           

           



         
        ),
        ),
    );
  }
}
