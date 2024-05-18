import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget(
      {super.key, required this.icon, required this.text, required this.onTap});
  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: ColorConstant.defIndigo),
            SizedBox(height: 8.0),
            Text(
              text,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
