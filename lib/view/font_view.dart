import 'package:flutter/material.dart';
import 'package:num_game/theme/theme_data.dart';

class MyView extends StatelessWidget {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'font view task',
      initialRoute: '/',
      theme: getApplicationTheme(),
      routes: {
        '/':(context)=>const MyView()
        
      },
    );
  }
}