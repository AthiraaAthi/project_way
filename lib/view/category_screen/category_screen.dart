import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/category_screen/category_widget.dart';

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
    "Income",
    "Food",
    "Notebooks",
  ];
  String dropdownValue = "Income";
  final List<Color> colors = [ColorConstant.defGreen, ColorConstant.defIndigo];
  final List<String> colorNames = [
    "Green",
    "Blue",
  ];

  String selectedColorName = "Blue";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.bgBlue,
        appBar: AppBar(
          backgroundColor: ColorConstant.defIndigo,
          title: Text(
            "Category Screen",
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      String localDropdownValue = dropdownValue;
                      String localSelectedColorName = selectedColorName;
                      titleController.clear();
                      desController.clear();

                      return StatefulBuilder(builder: (context, setState) {
                        void csetstate(VoidCallback fn) {
                          setState(fn);
                        }

                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                              height: 600,
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
                                        "Add Category",
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
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextField(
                                          controller: titleController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 16.0,
                                                    vertical: 12.0),
                                            border: InputBorder.none,
                                            hintText: "Category Name",
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
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextField(
                                          controller: desController,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 12.0),
                                              border: InputBorder.none,
                                              hintText: "Category Description",
                                              hintStyle: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey)),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 282,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
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
                                            value: localDropdownValue,
                                            items: categories
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
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
                                              csetstate(() {
                                                localDropdownValue = value!;
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
                                            Text("Indicator Color  :  "),
                                            Container(
                                                height: 50,
                                                width: 166.5,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: DropdownButton<String>(
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Colors.black,
                                                  ),
                                                  underline: Container(),
                                                  value: localSelectedColorName,
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
                                                              colorNames.indexOf(
                                                                  colorName)],
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      (String? newValue) {
                                                    csetstate(() {
                                                      localSelectedColorName =
                                                          newValue!;
                                                    });
                                                  },
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            mylist.add({
                                              'title': titleController.text,
                                              'description': desController.text,
                                              'color': localSelectedColorName,
                                            });
                                            dropdownValue = localDropdownValue;
                                            selectedColorName =
                                                localSelectedColorName;
                                          });

                                          Navigator.pop(context);
                                          titleController.clear();
                                          desController.clear();
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: ColorConstant.defIndigo,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                            child: Text(
                                              "Submit",
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
                              )),
                        );
                      });
                    },
                  );
                },
                child: Text(
                  "Add New",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
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
          child: ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) => CategoryWidget(
                title: mylist[index]['title']!,
                description: mylist[index]['description']!,
                color: colors[colorNames.indexOf(mylist[index]['color']!)]),
          ),
        ));
  }
}
