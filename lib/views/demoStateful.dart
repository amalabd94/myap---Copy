import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoeScreen extends StatefulWidget {
  const DemoeScreen({super.key});

  @override
  State<DemoeScreen> createState() => _DemoeScreenState();
}

class _DemoeScreenState extends State<DemoeScreen> {
  int x=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("counter"),) ,
      body: Center(child: Text("$x")),
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
        onPressed: (){
        x+=1;
        setState(() {

        });
      },
      ),
    );
  }
}
