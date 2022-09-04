import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covidtutorials/View/World-State.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 6),
       ()=> Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                WorldsStatesScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height:  40 ),
                  AnimatedBuilder(
                      animation: _controller,

                        child: Container(
                          height: 200,
                          width: 200,
                          child: Center(child: Image(image: AssetImage('assets/virus.png'),fit: BoxFit.cover,),),
                        ),
                      builder: (BuildContext Context, Widget? child) {
                        return Transform.rotate(
                            angle: _controller.value * 2.0 * math.pi, child: child);
                      }),
                  SizedBox(height:  MediaQuery.of (context).size.height*0.08, ),
                 // Text('Covid-19\n Tracker App'),
                  Container(
                    height: 100,
                    width: double.infinity,

                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Bobbers',
                        ),
                        child: Center(
                          child: AnimatedTextKit(
                            animatedTexts: [

                              TyperAnimatedText('Covid-19', textStyle: TextStyle(color: Colors.white)),
                              TyperAnimatedText('Tracker App', textStyle: TextStyle(color: Colors.white)),
                              TyperAnimatedText('Start app 5/10 seconds', textStyle: TextStyle(color: Colors.white)),
                              TyperAnimatedText('With .....', textStyle: TextStyle(color: Colors.white)),
                            ],
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ),
                      ),
                    ),

                ],
              ),
            ),
          ),
        ),
    );
  }
}
