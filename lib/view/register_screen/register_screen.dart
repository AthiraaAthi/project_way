import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<String> Numbers = ["91", "966", "971", "1"];
  String dropDownValue = "1";
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.bgBlue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.Logo),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Name",
                    hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //COUNTRY CODE
                  Container(
                    height: 50,
                    width: 58,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButton(
                      //underline: Container(),
                      value: dropDownValue,
                      items:
                          Numbers.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          dropDownValue = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 50,
                    width: 248,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Text("I accept your"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "terms and conditions",
                        style: TextStyle(color: Colors.indigo),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      color: ColorConstant.defIndigo,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?"),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
