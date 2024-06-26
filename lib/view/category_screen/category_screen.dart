import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/controller/category_provider.dart';
import 'package:project_way/model/category_model.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/category_screen/category_widget.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final titleController = TextEditingController();
  final desController = TextEditingController();
  List<Map<String, String>> mylist = [];
  List<String> categories = [
    "categoryscreen.addCategoryDialog.categoryOptions.incomeCategory".tr(),
    "categoryscreen.addCategoryDialog.categoryOptions.foodCategory".tr(),
    "categoryscreen.addCategoryDialog.categoryOptions.noteCategory".tr(),
  ];
  String dropdownValue =
      "categoryscreen.addCategoryDialog.categoryOptions.incomeCategory".tr();
  final List<Color> colors = [ColorConstant.defGreen, ColorConstant.defIndigo];
  final List<String> colorNames = [
    "Green",
    "Blue",
  ];

  String selectedColorName = "Blue";
  @override
  Widget build(BuildContext context) {
    double fontSize = 12;

    if (context.locale.languageCode == 'en') {
      fontSize = 14;
    } else if (context.locale.languageCode == 'ml') {
      fontSize = 17;
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.bgBlue,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
          backgroundColor: ColorConstant.defIndigo,
          title: MediaQuery.of(context).size.width < 600
              ? Text(
                  "categoryscreen.categoryScreenTitle".tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: context.locale.languageCode == 'en' ? 20 : 18,
                      fontWeight: FontWeight.w500),
                )
              : Text(
                  "categoryscreen.categoryScreenTitle".tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: MediaQuery.of(context).size.width < 600
                  ? Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    )),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      String localDropdownValue = categories[0];
                      String localSelectedColorName = colorNames[0];
                      titleController.clear();
                      desController.clear();

                      return StatefulBuilder(
                        builder: (context, setState) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MediaQuery.of(context).size.width < 600
                                ? Container(
                                    height: 500,
                                    width: 440,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            Text(
                                              "categoryscreen.addCategoryDialog.categoryTitle"
                                                  .tr(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextField(
                                                controller: titleController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 12.0),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "categoryscreen.addCategoryDialog.categoryNameHint"
                                                          .tr(),
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              height: 130,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextField(
                                                controller: desController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 12.0),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "categoryscreen.addCategoryDialog.categoryDescriptionHint"
                                                          .tr(),
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 282,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: DropdownButton<String>(
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Colors.black,
                                                  ),
                                                  underline: Container(),
                                                  value: dropdownValue,
                                                  items: categories.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 13),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String? value) {
                                                    print(
                                                        "New dropdown value selected: $value");
                                                    setState(() {
                                                      dropdownValue = value!;
                                                    }); ///////////////
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 282,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "categoryscreen.addCategoryDialog.dropdownLabel"
                                                        .tr(),
                                                    style: TextStyle(
                                                        fontSize: fontSize,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    width: 166.5,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child:
                                                        DropdownButton<String>(
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: Colors.black,
                                                      ),
                                                      underline: Container(),
                                                      value: selectedColorName,
                                                      items: colorNames.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                        (String colorName) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: colorName,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                width: 120,
                                                                height: 24,
                                                                color: colors[
                                                                    colorNames
                                                                        .indexOf(
                                                                            colorName)],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(
                                                          () {
                                                            selectedColorName =
                                                                newValue!;
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (titleController
                                                        .text.isNotEmpty &&
                                                    desController
                                                        .text.isNotEmpty) {
                                                  final categoryProvider =
                                                      Provider.of<
                                                              categoryprovider>(
                                                          context,
                                                          listen: false);
                                                  categoryProvider.addCategory(
                                                    Category(
                                                      title:
                                                          titleController.text,
                                                      description:
                                                          desController.text,
                                                      colorName:
                                                          selectedColorName,
                                                    ),
                                                  );

                                                  Navigator.pop(context);
                                                  titleController.clear();
                                                  desController.clear();
                                                } else {
                                                  print(
                                                      "Please fill out all fields");
                                                }
                                              },
                                              child: Container(
                                                height: 45,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.defIndigo,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "categoryscreen.addCategoryDialog.submitButton"
                                                        .tr(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                :

                                ///tab dialog
                                Container(
                                    height: 730,
                                    width: 540,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          children: [
                                            Text(
                                              "categoryscreen.addCategoryDialog.categoryTitle"
                                                  .tr(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              height: 70,
                                              width: 450,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextField(
                                                style: TextStyle(fontSize: 20),
                                                controller: titleController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                    horizontal: 150,
                                                    vertical: 20,
                                                  ),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "categoryscreen.addCategoryDialog.categoryNameHint"
                                                          .tr(),
                                                  hintStyle: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                              height: 230,
                                              width: 450,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: TextField(
                                                style: TextStyle(fontSize: 20),
                                                controller: desController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 120,
                                                          vertical: 100),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "categoryscreen.addCategoryDialog.categoryDescriptionHint"
                                                          .tr(),
                                                  hintStyle: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                              height: 70,
                                              width: 450,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: DropdownButton<String>(
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                  underline: Container(),
                                                  value: dropdownValue,
                                                  items: categories.map<
                                                      DropdownMenuItem<String>>(
                                                    (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              fontSize: 20),
                                                        ),
                                                      );
                                                    },
                                                  ).toList(),
                                                  onChanged: (String? value) {
                                                    print(
                                                        "New dropdown value selected: $value");
                                                    setState(
                                                      () {
                                                        dropdownValue = value!;
                                                      },
                                                    ); ///////////////
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              height: 70,
                                              width: 450,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "categoryscreen.addCategoryDialog.dropdownLabel"
                                                        .tr(),
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  Container(
                                                    height: 70,
                                                    width: 266.5,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child:
                                                        DropdownButton<String>(
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: Colors.black,
                                                        size: 30,
                                                      ),
                                                      underline: Container(),
                                                      value: selectedColorName,
                                                      items: colorNames.map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String colorName) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: colorName,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              width: 200,
                                                              height: 34,
                                                              color: colors[
                                                                  colorNames
                                                                      .indexOf(
                                                                          colorName)],
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          selectedColorName =
                                                              newValue!;
                                                        });
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (titleController
                                                        .text.isNotEmpty &&
                                                    desController
                                                        .text.isNotEmpty) {
                                                  final categoryProvider =
                                                      Provider.of<
                                                              categoryprovider>(
                                                          context,
                                                          listen: false);
                                                  categoryProvider.addCategory(
                                                    Category(
                                                      title:
                                                          titleController.text,
                                                      description:
                                                          desController.text,
                                                      colorName:
                                                          selectedColorName,
                                                    ),
                                                  );

                                                  Navigator.pop(context);
                                                  titleController.clear();
                                                  desController.clear();
                                                } else {
                                                  print(
                                                      "Please fill out all fields");
                                                }
                                              },
                                              child: Container(
                                                height: 55,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                    color:
                                                        ColorConstant.defIndigo,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Center(
                                                  child: Text(
                                                    "categoryscreen.addCategoryDialog.submitButton"
                                                        .tr(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                          );
                        },
                      );
                    },
                  );
                },
                child: MediaQuery.of(context).size.width < 600
                    ? Text(
                        "categoryscreen.addNew".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    : Text(
                        "categoryscreen.addNew".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 18,
            right: 15,
          ),
          child: Consumer<categoryprovider>(
            builder: (context, categoryprovider, child) {
              return ListView.builder(
                itemCount: categoryprovider.categories.length,
                itemBuilder: (context, index) {
                  final category = categoryprovider.categories[index];
                  return CategoryWidget(
                    title: category.title,
                    description: category.description,
                    color: colors[colorNames.indexOf(category.colorName)],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
