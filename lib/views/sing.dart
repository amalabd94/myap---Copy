import 'package:flutter/material.dart';
import 'package:myap/models/city.dart';
import 'package:myap/viewmodels/cities_vm.dart';
import 'package:myap/viewmodels/user_vm.dart';

class Sing extends StatefulWidget {
  Sing({Key? key}) : super(key: key);

  @override
  State<Sing> createState() => _Sing();
}

class _Sing extends State<Sing> {
  GlobalKey<FormState> forky = GlobalKey();

  String? gender = "male";
  bool isTermAccprt = false;
  bool isTermAcc = true;
  String? selected;
  CitiesVm citty = CitiesVm();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 219, 15, 15)),
                          image: DecorationImage(
                              image: AssetImage('images/b.jpg'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromRGBO(239, 56, 43, 1)),
                      // image: DecorationImage(image: AssetImage('images/b.jpg'),fit: BoxFit.fill),
                    ),
                  ),
                  TextFormField(
                    // keyboardType: TextInputType.emailAddress,
                    validator: (x) => x != null && x.isNotEmpty
                        ? null
                        : "this field is required",
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Color.fromRGBO(255, 77, 7, 1),
                        ),
                        hintText: "input name",
                        label: Text("your name : ",
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
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.name,
                    validator: (x) => x != null && x.isNotEmpty
                        ? null
                        : "this field is required",
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(255, 233, 12, 52),
                        ),
                        // hintText: "input email",
                        label: Text(
                          "your email : ",
                          style:
                              TextStyle(color: Color.fromRGBO(255, 77, 7, 1)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    // keyboardType: TextInputType.visiblePassword,
                    validator: (x) => x != null && x.isNotEmpty
                        ? null
                        : "this field is required",
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(255, 77, 7, 1),
                      ),
                      label: Text(
                        " in password : ",
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
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Radio(
                          value: "male",
                          groupValue: gender,
                          onChanged: (x) {
                            gender = x;
                            setState(() {});
                          }),
                      Text("Male"),
                      Radio(
                          value: "Fmale",
                          groupValue: gender,
                          onChanged: (x) {
                            gender = x;
                            setState(() {});
                          }),
                      Text("Fmale"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: isTermAccprt,
                          onChanged: (x) {
                            isTermAccprt = x!;

                            setState(() {});
                          }),
                      Text("Accept Term and condition"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: isTermAcc,
                          onChanged: (x) {
                            isTermAcc = x!;
                            setState(() {});
                          }),
                      Text("checbox htt"),
                    ],
                  ),
                  DropdownButton(
                      value: selected,
                      hint: Text("Select the city"),
                      items: citty
                          .loadCities()
                          .map((c) => DropdownMenuItem(
                                child: Text(c.name),
                                value: c.value,
                              ))
                          .toList(),
                      onChanged: (c) {
                        setState(() {
                          selected = c;
                        });
                      }),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 250, 91, 60),
                    ),
                    onPressed: () {
                      forky.currentState!.reset();
                    },
                    child: Text("Reset"),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 233, 12, 52),
          onPressed: () {
            if (forky.currentState!.validate()) {
              UserVm userVm = UserVm();
              userVm.register(
                  email: emailController.text = "",
                  name: nameController.text = "",
                  password: passwordController.text = "");
              // إذا كانت جميع الحقول صالحة، قم بتنفيذ هذا الكود
            }
          },
          child: Icon(
            Icons.save,
            color: Color.fromRGBO(245, 217, 38, 0.859),
          ),
        ),
      ),
    );
  }
  

  checkEmail(String? email) {
    return "the email incorrect format";
  }
}
