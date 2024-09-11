import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:myap/models/delivery.dart';
import 'package:myap/viewmodels/delivery_vm.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _Order();
}

class _Order extends State<Order> {
  GlobalKey<FormState> forky = GlobalKey();
  String? selectedTiming;
  String? payment = 'upon receipt';
  DeliveryVm deliy = DeliveryVm();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(10),
            // width: 150,height:150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(150),
            // image: DecorationImage(image: AssetImage("images/b.jpg"),fit: BoxFit.fill),
            child: Form(
              key: forky,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (x) {
                        // تقسيم النص الى  دالة split
                        // لازالة المسافات الزايدة من بداية ونهاية النص trim دالة
                        if (x == null ||
                            x.trim().split(RegExp(r'\s+')).length < 3) {
                          return "please enter three names";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Color.fromRGBO(255, 77, 7, 1),
                        ),
                        hintText: "name  recipient",
                        label: Text("name  recipient ",
                            style: TextStyle(color: Color(0xFFFFA407))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    /* validator: (x) {
                      if ((x == null) ||
                          (x.length == 9) ||
                          (!RegExp(r'^(71|77|73|78|70)\d+$').hasMatch(x))) {
                        return "The entries are invalid";
                      }
                      return null;
                    },*/

                    //حل اخر
                    validator: (x) {
                      if (x != null && x.isNotEmpty) {
                        if (x.length == 9) {
                          if (x[0] == "7" &&
                              (x[1] == "7" ||
                                  x[1] == "1" ||
                                  x[1] == "3" ||
                                  x[1] == "8" ||
                                  x[1] == "0")) return null;

                          return " Input error";
                        }
                        return "must be a nine-digit number";
                      }
                      return "The entries are invalid";
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Color.fromRGBO(255, 77, 7, 1),
                        ),
                        hintText: "Number phone",
                        label: Text("number  ",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 77, 7, 1))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(color: Color.fromRGBO(255, 77, 7, 1)),
                    value: selectedTiming,
                    hint: Text(
                      "select the delivery timing",
                      style: TextStyle(color: Color(0xFFFF8F07)),
                    ),
                    items: deliy.loadTime().map((c) {
                      return DropdownMenuItem(
                        child: Text(c.name),
                        value: c.value,
                      );
                    }).toList(),
                    onChanged: (c) {
                      setState(() {
                        selectedTiming = c;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a timing';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Payment Method",
                    style: TextStyle(color: Color.fromARGB(255, 255, 164, 7)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Radio(
                          value: "upon receipt",
                          groupValue: payment,
                          onChanged: (x) {
                            payment = x;
                            setState(() {});
                          }),
                      Text(
                        "upon receipt",
                        style: TextStyle(color: Color.fromRGBO(255, 77, 7, 1)),
                      ),
                      Radio(
                          value: "Al-Omqi",
                          groupValue: payment,
                          onChanged: (x) {
                            payment = x;
                            setState(() {});
                          }),
                      Text(
                        "Al-Omqi",
                        style: TextStyle(color: Color.fromRGBO(255, 77, 7, 1)),
                      ),
                      Radio(
                          value: "Al-Kuraimi",
                          groupValue: payment,
                          onChanged: (x) {
                            payment = x;
                            setState(() {});
                          }),
                      Text(
                        "Al-Kuraimi",
                        style: TextStyle(color: Color.fromRGBO(255, 77, 7, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.note,
                        color: Color.fromRGBO(255, 77, 7, 1),
                      ),
                      label: Text(
                        "  ",
                        style: TextStyle(color: Color.fromRGBO(255, 77, 7, 1)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 250, 91, 60),
                    ),
                    onPressed: () {
                      forky.currentState!.reset();
                    },
                    child: Text("Reset"),
                  )

                  /* ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 250, 91, 60),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/rececip');
                    },
                    child: Text("Order"),
                  ),*/
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 233, 12, 52),
          onPressed: () {
            if (forky.currentState!.validate()) {
              Navigator.pushNamed(context, '/rececip');
            }
            ;
            // إذا كانت جميع الحقول صالحة، قم بتنفيذ هذا الكود
          },
          child: Icon(
            Icons.save,
            color: Color.fromRGBO(245, 217, 38, 0.859),
          ),
        ),
      ),
    );
  }
}
