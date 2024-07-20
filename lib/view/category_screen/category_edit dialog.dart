import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/controller/category_provider.dart';
import 'package:project_way/controller/dropdown_provider.dart';
import 'package:project_way/model/category_model.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:provider/provider.dart';

class CategoryDialog extends StatelessWidget {
  const CategoryDialog(
      {super.key,
      required this.titleController,
      required this.descriptionController,
      required this.colorNameController,
      required this.categories,
      required this.colorNames,
      required this.category,
      required this.onSubmit});
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final String colorNameController;
  final List<String> categories;
  final List<String> colorNames;
  final Category category; // Assuming Category is your model class
  final Function(Category) onSubmit; // Callback function to handle submit
  @override
  Widget build(BuildContext context) {
    String localDropdownValue = categories[0];
    String localSelectedColorName = colorNames[0];
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
                        "categoryscreen.addCategoryDialog.Editcategory".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            border: InputBorder.none,
                            hintText:
                                "categoryscreen.addCategoryDialog.categoryNameHint"
                                    .tr(),
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.grey),
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
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            border: InputBorder.none,
                            hintText:
                                "categoryscreen.addCategoryDialog.categoryDescriptionHint"
                                    .tr(),
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
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
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Consumer<DropdownProvider>(
                            builder: (context, provider, child) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              underline: Container(),
                              value: provider.dropdownValue2,
                              items: provider.categories
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 13),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                print("New dropdown value selected: $value");
                                provider.setDropdownValue2(value!);

                                ///added provider for income/expense drpdwn
                              },
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: 282,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Text(
                              "categoryscreen.addCategoryDialog.dropdownLabel"
                                  .tr(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 166.5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Consumer<DropdownProvider>(
                                  builder: (context, provider, child) {
                                return DropdownButton<String>(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                  ),
                                  underline: Container(),
                                  value: provider.colorNameController,
                                  items: provider.colorNames
                                      .map<DropdownMenuItem<String>>(
                                    (String colorName) {
                                      int index = provider.colorNames
                                          .indexOf(colorName);
                                      Color color = index != -1
                                          ? provider.colors[index]
                                          : Colors
                                              .transparent; // Default color if not found
                                      return DropdownMenuItem<String>(
                                        value: colorName,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              width: 120,
                                              height: 24,
                                              color: color),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: /////////////////
                                      (String? newValue) {
                                    provider.setColorNameController(
                                      newValue!,
                                    );
                                  },
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          final updatedTitle = titleController.text;
                          final updatedDescription = descriptionController.text;
                          final updatedColorName =
                              Provider.of<DropdownProvider>(context,
                                      listen: false)
                                  .colorNameController;
                          if (updatedTitle.isNotEmpty &&
                              updatedDescription.isNotEmpty &&
                              updatedColorName.isNotEmpty &&
                              updatedColorName.isNotEmpty) {
                            Provider.of<CategoryProvider>(context,
                                    listen: false)
                                .updateCategory(Category(
                              id: category.id,
                              title: updatedTitle,
                              description: updatedDescription,
                              colorName: updatedColorName,
                            ));

                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                                content: Text(
                                  'All fields are required!',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                            color: ColorConstant.defIndigo,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "categoryscreen.addCategoryDialog.submitButton"
                                  .tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
                        "categoryscreen.addCategoryDialog.Editcategory".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 70,
                        width: 450,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          controller: titleController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 150,
                              vertical: 20,
                            ),
                            border: InputBorder.none,
                            hintText:
                                "categoryscreen.addCategoryDialog.categoryNameHint"
                                    .tr(),
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
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
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          controller: descriptionController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 120, vertical: 100),
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
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Consumer<DropdownProvider>(
                              builder: (context, provider, child) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                underline: Container(),
                                value: provider.dropdownValue2,
                                items: provider.categories
                                    .map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                                onChanged: (String? value) {
                                  print("New dropdown value selected: $value");
                                  provider.setDropdownValue2(
                                      value!); //////CHANGED TAB DROPDOWN OF INCOME/EXPENSE/////////
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 70,
                        width: 450,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Text(
                              "categoryscreen.addCategoryDialog.dropdownLabel"
                                  .tr(),
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              height: 70,
                              width: 266.5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Consumer<DropdownProvider>(
                                  builder: (context, provider, child) {
                                return DropdownButton<String>(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  underline: Container(),
                                  value: provider.colorNameController,
                                  items: provider.colorNames
                                      .map<DropdownMenuItem<String>>(
                                          (String colorName) {
                                    int index =
                                        provider.colorNames.indexOf(colorName);
                                    Color color = index != -1
                                        ? provider.colors[index]
                                        : Colors
                                            .transparent; // Default color if not found
                                    return DropdownMenuItem<String>(
                                      value: colorName,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            width: 200, height: 34, color: color
                                            // provider
                                            //         .colors[
                                            //     provider
                                            //         .colorNames
                                            //         .indexOf(
                                            //             colorName)],
                                            ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    provider.setColorNameController(
                                      newValue!,
                                    ); ///////CHNAGED STATE FOR COLOR DROPDOWN TAB
                                  },
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          final updatedTitle = titleController.text;
                          final updatedDescription = descriptionController.text;
                          final updatedColorName =
                              Provider.of<DropdownProvider>(context,
                                      listen: false)
                                  .colorNameController;
                          if (updatedTitle.isNotEmpty &&
                              updatedDescription.isNotEmpty &&
                              updatedColorName.isNotEmpty &&
                              updatedColorName.isNotEmpty) {
                            Provider.of<CategoryProvider>(context,
                                    listen: false)
                                .updateCategory(Category(
                              id: category.id,
                              title: updatedTitle,
                              description: updatedDescription,
                              colorName: updatedColorName,
                            ));

                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.redAccent,
                                duration: Duration(seconds: 2),
                                content: Text("Please fill all fields")));
                          }
                        },
                        child: Container(
                          height: 55,
                          width: 300,
                          decoration: BoxDecoration(
                              color: ColorConstant.defIndigo,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "categoryscreen.addCategoryDialog.submitButton"
                                  .tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
  }
}
