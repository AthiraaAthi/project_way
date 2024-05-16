import 'package:flutter/material.dart';
import 'package:project_way/view/language_selection/language_selection.dart';

void main() {
  runApp(ProjectWay());
}

class ProjectWay extends StatelessWidget {
  const ProjectWay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguageSelection(),
    );
  }
}
