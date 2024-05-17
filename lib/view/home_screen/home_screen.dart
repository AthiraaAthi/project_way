import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.bgBlue,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: ColorConstant.defIndigo,
            )
          ],
        ),
      ),
    );
  }
}
