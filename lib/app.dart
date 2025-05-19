
import 'package:flutter/material.dart';
import 'package:num_game/view/card_view.dart';
import 'package:num_game/view/container_view.dart';
import 'package:num_game/view/flexible_expanded_view.dart';
import 'package:num_game/view/load_image_view.dart';
import 'package:num_game/view/login_page_view.dart';
import 'package:num_game/view/media_query_view.dart';
import 'package:num_game/view/num_game.dart';
import 'package:num_game/view/rows_columns_view.dart';
import 'package:num_game/view/student_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardView(),
    );
  }
}