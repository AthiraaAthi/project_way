import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class PasswordsScreen extends StatelessWidget {
  const PasswordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.defIndigo,
        title: Text(
          "My Passwords",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          Text(
            "Add New",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
