import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ovid_app/View/world_State.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WorldState())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
            AnimatedBuilder(
              child: Container(
                width: 200,
                height: 200,
                child: Center(
                  child: Image(
                    image: AssetImage('images/virus.png'),
                  ),
                ),
              ),
                animation: _controller,
                builder:  (BuildContext context, Widget? child) {

              return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            }),
                SizedBox(height: MediaQuery.of(context).size.height * .08,),
                const Align(
                    alignment: Alignment.center,
                    child :Text('Covid-19\nTracker App' , textAlign: TextAlign.center ,
                      style: TextStyle(fontWeight: FontWeight.bold , fontSize: 25)
                      ,))
        
          ], 
        ),
      ),
    );
  }
}
