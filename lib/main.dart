import 'package:flutter/material.dart';
import 'package:project_way/controller/category_provider.dart';
import 'package:project_way/view/language_selection/language_selection.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProjectWay());
}

class ProjectWay extends StatelessWidget {
  const ProjectWay({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => categoryprovider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LanguageSelection(),
      ),
    );
  }
}
