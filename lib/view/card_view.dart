
import 'package:flutter/material.dart';
import 'package:num_game/common/my_card.dart';
import 'package:num_game/common/my_snackbar.dart';


class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          
          child: Column(
            children: [
              for (int i = 0; i < 10; i++)
              GestureDetector(
               onTap: () {
                showMySnackBar(
                  context: context,
                  message: "container one clicked",
                );
              },
               child: MyCard(title: "Card $i", color: Colors.amber),
              )
            ],
          ),
        ),
      ),
    );
  }
}