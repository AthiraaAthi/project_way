import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/controller/category_provider.dart';
import 'package:project_way/controller/dropdown_provider.dart';
import 'package:project_way/model/category_model.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/category_screen/category_edit%20dialog.dart';
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
    "categoryscreen.addCategoryDialog.categoryOptions.expenseCategory".tr(),
  ];
  String dropdownValue =
      "categoryscreen.addCategoryDialog.categoryOptions.incomeCategory".tr();

  final List<Color> colors = [
    ColorConstant.defGreen,
    ColorConstant.defIndigo,
    const Color.fromARGB(255, 230, 57, 45),
    Colors.yellow
  ];
  final List<String> colorNames = [
    "Green",
    "Blue",
    "Red",
    "yellow",
  ];

  String selectedColorName = "Green";

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: MediaQuery.of(context).size.width < 600
                  ? const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )
                  : const Icon(
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
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
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
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 12.0),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "categoryscreen.addCategoryDialog.categoryNameHint"
                                                          .tr(),
                                                  hintStyle: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
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
                                                maxLines: null,
                                                textAlign: TextAlign.justify,
                                                controller: desController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 12.0),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "categoryscreen.addCategoryDialog.categoryDescriptionHint"
                                                          .tr(),
                                                  hintStyle: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
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
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  icon: const Icon(
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
                                                        style: const TextStyle(
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
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 282,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "categoryscreen.addCategoryDialog.dropdownLabel"
                                                        .tr(),
                                                    style: TextStyle(
                                                      fontSize: fontSize,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
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
                                                      icon: const Icon(
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
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            InkWell(
                                              // onTap: () {
                                              //   if (titleController
                                              //           .text.isNotEmpty &&
                                              //       desController
                                              //           .text.isNotEmpty) {
                                              //     final categoryProvider =
                                              //         Provider.of<
                                              //                 CategoryProvider>(
                                              //             context,
                                              //             listen: false);
                                              //     categoryProvider.addCategory(
                                              //       Category(
                                              //         title:
                                              //             titleController.text,
                                              //         description:
                                              //             desController.text,
                                              //         colorName:
                                              //             selectedColorName,
                                              //       ),
                                              //     );

                                              //     Navigator.pop(context);
                                              //     titleController.clear();
                                              //     desController.clear();
                                              //   } else {
                                              //     print(
                                              //         "Please fill out all fields");
                                              //   }
                                              // },
                                              onTap: () {
                                                if (titleController
                                                        .text.isNotEmpty &&
                                                    desController
                                                        .text.isNotEmpty) {
                                                  final categoryProvider =
                                                      Provider.of<
                                                              CategoryProvider>(
                                                          context,
                                                          listen: false);
                                                  final newCategory = Category(
                                                    title: titleController.text,
                                                    description:
                                                        desController.text,
                                                    colorName:
                                                        selectedColorName,
                                                  );

                                                  categoryProvider
                                                      .addCategory(newCategory);
                                                  Navigator.pop(context,
                                                      newCategory); ///////
                                                  titleController.clear();
                                                  desController.clear();
                                                  // selectedColorName = "Green"; ////////////////
                                                } else {
                                                  const SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    duration:
                                                        Duration(seconds: 3),
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                      "Please add all fields",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  );
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
                                                    style: const TextStyle(
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
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20),
                                            ),
                                            const SizedBox(
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
                                                style: const TextStyle(
                                                    fontSize: 20),
                                                controller: titleController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                    horizontal: 150,
                                                    vertical: 20,
                                                  ),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "categoryscreen.addCategoryDialog.categoryNameHint"
                                                          .tr(),
                                                  hintStyle: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
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
                                                style: const TextStyle(
                                                    fontSize: 20),
                                                controller: desController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 120,
                                                          vertical: 100),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "categoryscreen.addCategoryDialog.categoryDescriptionHint"
                                                          .tr(),
                                                  hintStyle: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
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
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: DropdownButton<String>(
                                                  isExpanded: true,
                                                  icon: const Icon(
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
                                                          style:
                                                              const TextStyle(
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
                                            const SizedBox(
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
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "categoryscreen.addCategoryDialog.dropdownLabel"
                                                          .tr(),
                                                      style: const TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 70,
                                                      width: 266.5,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: DropdownButton<
                                                          String>(
                                                        icon: const Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color: Colors.black,
                                                          size: 30,
                                                        ),
                                                        underline: Container(),
                                                        value:
                                                            selectedColorName,
                                                        items: colorNames.map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            colorName) {
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
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            InkWell(
                                              // onTap: () {
                                              //   if (titleController
                                              //           .text.isNotEmpty &&
                                              //       desController
                                              //           .text.isNotEmpty) {
                                              //     final categoryProvider =
                                              //         Provider.of<
                                              //                 CategoryProvider>(
                                              //             context,
                                              //             listen: false);
                                              //     categoryProvider.addCategory(
                                              //       Category(
                                              //         title:
                                              //             titleController.text,
                                              //         description:
                                              //             desController.text,
                                              //         colorName:
                                              //             selectedColorName,
                                              //       ),
                                              //     );

                                              //     Navigator.pop(context);
                                              //     titleController.clear();
                                              //     desController.clear();
                                              //   } else {
                                              //     print(
                                              //         "Please fill out all fields");
                                              //   }
                                              // },
                                              onTap: () {
                                                if (titleController
                                                        .text.isNotEmpty &&
                                                    desController
                                                        .text.isNotEmpty) {
                                                  final categoryProvider =
                                                      Provider.of<
                                                              CategoryProvider>(
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
                                                    style: const TextStyle(
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
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    : Text(
                        "categoryscreen.addNew".tr(),
                        style: const TextStyle(
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
          child: Consumer<CategoryProvider>(
            builder: (context, categoryprovider, child) {
              return ListView.builder(
                itemCount: categoryprovider.categories.length,
                itemBuilder: (context, index) {
                  final category = categoryprovider.categories[index];
                  return CategoryWidget(
                    title: category.title,
                    description: category.description,
                    color: colors[colorNames.indexOf(category.colorName)],
                    onEditTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          String localDropdownValue = categories[0];
                          String localSelectedColorName = colorNames[0];
                          // titleController.text = category.title;
                          // desController.text = category.description;
                          // String colorNameee = category.colorName;
                          final titleController2 =
                              TextEditingController(text: category.title);
                          final descriptionController2 =
                              TextEditingController(text: category.description);
                          String colorNameController = category.colorName;
                          return CategoryDialog(
                            titleController: titleController2,
                            descriptionController: descriptionController2,
                            colorNameController: colorNameController,
                            categories: Provider.of<CategoryProvider>(context,
                                    listen: false)
                                .categories
                                .map((category) => category.title)
                                .toList(),
                            colorNames: Provider.of<DropdownProvider>(context,
                                    listen: false)
                                .colorNames,
                            category: category,
                            onSubmit: (updatedCategory) {
                              categoryProvider.updateCategory(updatedCategory);
                            },
                          );
                        },
                      );
                    },
                    onDeleteTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Container(
                          height: 200,
                          child: AlertDialog(
                            title: Text(
                              "categoryscreen.CategoryDelete".tr(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "categoryscreen.CategoryNo".tr(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  MediaQuery.of(context).size.width < 600
                                      ? categoryProvider
                                          .removeCategory(category.id!)
                                      : categoryProvider
                                          .removeCategory(category.id!);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "categoryscreen.Categoryyes".tr(),
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
