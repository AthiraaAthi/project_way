import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 2))],
        border: Border(bottom: BorderSide(color: Colors.grey)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            size: 45,
            color: ColorConstant.defIndigo,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.indigo),
            ),
          ),
        ],
      ),
    );
  }
}
