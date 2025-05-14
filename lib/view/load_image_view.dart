import 'package:flutter/material.dart';

class LoadImageView extends StatelessWidget {
  const LoadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: SizedBox(
          height: 400,
          width: 40,

          child: Center(
            child: Image.network('https://www.google.com/search?sca_esv=db94c43514cdc207&rlz=1C1GCEU_enNP1160NP1160&q=online+image&udm=2&fbs=ABzOT_BjGLk_LzE3astNJFz6GHsg1f6dwjj1tnV49JiRqmLqmdBSW9msic6QH6uZYS_t12paaEOV8TvOVEGMsLOSpqD9O8DILUFPg6jzoaRZpKlIUgi3YGpcvCijLVjTdnyCBopzs06hoOEfXpV7VBA9N44AvzE2ogCRwIkXS0XPC7lt4HDT8nkUK9hRFIO0wVuIDrtEWkWW392m1K4ojDOgzeqdqt1aeeo6qoOYGSv5C6QvHGSAGHMaa4dhOTb8lEXAfxgToBdm&sa=X&ved=2ahUKEwi2wJbL25-NAxUs8zgGHfmaJScQtKgLegQIJhAB&biw=1280&bih=585&dpr=1.5#vhid=r5MP1kh6VDK9DM&vssid=mosaic'),
          ),
        ),
      ),
    );
  }
}
