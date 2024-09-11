import 'package:flutter/material.dart';
import 'package:myap/viewmodels/products_vm.dart';

class Receipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rceeipt screen"),
      ),
      body: Text("Thank you your request has been received",
          style:
              TextStyle(color: Color.fromARGB(245, 255, 127, 7), fontSize: 30)),
      backgroundColor: Color.fromRGBO(8, 223, 223, 0.486),
    );
  }
}
