import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class BudgetGraphScreen extends StatelessWidget {
  const BudgetGraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgBlue,
      appBar: AppBar(
        backgroundColor: ColorConstant.defIndigo,
        title: Text(
          "Budget Graph",
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
      ),
    );
  }
}
