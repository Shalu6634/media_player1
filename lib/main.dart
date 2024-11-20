import 'package:flutter/material.dart';
import 'package:media_player1/provider/search_provider.dart';
import 'package:media_player1/provider/song_provider.dart';
import 'package:media_player1/view/home_page.dart';
import 'package:media_player1/view/searchScreen.dart';
import 'package:media_player1/view/song_page.dart';
import 'package:media_player1/view/splash.dart';
import 'package:media_player1/view/splash_Screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => SongProvider(),),
        ChangeNotifierProvider(create: (context) => SearchProvider(),),
      ],
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/splash':(context)=>SplashScreen(),
          '/':(context)=>SplashPage(),
           '/home':(context)=>const HomePage(),
          '/screen':(context)=>const SearchScreen(),
          '/song':(context)=>const SongPlayPage(),
        },
      ),
    );
  }
}
