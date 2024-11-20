import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushNamed('/splash');
    },);
    return Scaffold(
    backgroundColor:  Color(0xff1d0630),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/headphone.png')),
                  ),

                ),
              ),
              Text('...Music App...',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 19),),
            ],
          ),
        ),
      ),
    );
  }
}
