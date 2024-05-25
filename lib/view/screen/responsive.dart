import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key, this.mobile, this.tab});
  final mobile;
  final tab;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 760) {
        return mobile;
      } else {
        return tab;
      }
    });
  }
}
