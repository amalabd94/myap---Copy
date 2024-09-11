import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10),(){
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset("amges/a4.jpg"),),
          SizedBox(height:20 ,),
          Center(child: CircularProgressIndicator(),)
        ],
      ),
    );
  }
}
