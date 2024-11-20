import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d0630),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/headphone.png')),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const Padding(
                padding:  EdgeInsets.only(left: 43),
                child:  Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'enjoy your',
                        style: TextStyle(color: Colors.white, fontSize: 34,height: 0.8),
                      ),
                      TextSpan(
                        text: ' \nmusic,',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,height: 0.03),
                      ),
                      TextSpan(
                        text: ' enjoy\nyour ',
                        style: TextStyle(color: Colors.white, fontSize: 34,height: 1.3),
                      ),
                      TextSpan(
                        text: 'life ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,height: 0.1),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Welcome to your musical haven, where every beat is \na journey and every melody tells a story',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/home');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 43,top: 5),
                  child: Container(
                    height: 45,
                    width: 180,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffae52f4),
                          Color(0xffca89fc),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text('GET STARTED',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                        SizedBox(
                          width: 40,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
