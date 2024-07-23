import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:project_way/controller/category_provider.dart';
import 'package:project_way/database/table_db/table_db.dart';
import 'package:project_way/model/category_model.dart';
import 'package:project_way/model/table_model.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/budget_goal/weekly_budget_edit.dart';
import 'package:project_way/view/category_screen/category_screen.dart';
import 'package:project_way/view/screen/responsive.dart';
import 'package:provider/provider.dart';

class BudgetGoalScreen extends StatefulWidget {
  const BudgetGoalScreen({super.key});

  @override
  State<BudgetGoalScreen> createState() => _BudgetGoalScreenState();
}

class _BudgetGoalScreenState extends State<BudgetGoalScreen> {
  List<String> numbers = [
    // for year
    "budget_goal_screen.dropdowns.year_selection".tr(),
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
  ];

  String dropDownValue = "budget_goal_screen.dropdowns.year_selection".tr();
  List<String> months = [
    // for month
    "budget_goal_screen.dropdowns.month_selection".tr(),

    "budget_goal_screen.budget_months.Jan".tr(),
    "budget_goal_screen.budget_months.Feb".tr(),
    "budget_goal_screen.budget_months.Mar".tr(),
    "budget_goal_screen.budget_months.Apr".tr(),
    "budget_goal_screen.budget_months.May".tr(),
    "budget_goal_screen.budget_months.Jun".tr(),
    "budget_goal_screen.budget_months.Jul".tr(),
    "budget_goal_screen.budget_months.Aug".tr(),
    "budget_goal_screen.budget_months.Sep".tr(),
    "budget_goal_screen.budget_months.Oct".tr(),
    "budget_goal_screen.budget_months.Nov".tr(),
    "budget_goal_screen.budget_months.Dec".tr(),
  ];
  String dropDownMonthValue =
      "budget_goal_screen.dropdowns.month_selection".tr();
  List<String> MonthOrWeek = [
    "budget_goal_screen.dropdowns.monthly".tr(),
    "budget_goal_screen.dropdowns.weekly".tr()
  ]; // week or month selection
  String dropDownMonthOrWeekValue = "budget_goal_screen.dropdowns.monthly".tr();

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  Future _selectDate(
      //for showing the picked date
      BuildContext context,
      TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
    }
  }

  List<Map<String, String>> enteredvalues = [];
  TableDb tableDb = TableDb();
  int? editingIndex;
  String categorydropdownValue = '';
  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final categoryProvider =
          Provider.of<CategoryProvider>(context, listen: false);
      bool categoriesAvailable = categoryProvider.categories.isNotEmpty;
      categorydropdownValue = categoriesAvailable
          ? categoryProvider.categories[0].title
          : 'Add categories';
      selectedCategory = categorydropdownValue;
    });
    fetchData();
  }

  fetchData() async {
    List<Map<String, dynamic>> entries = await tableDb.getAllEntries();
    setState(() {
      enteredvalues = entries.map((entry) {
        return {
          'amount': entry['amount'].toString(), // Ensure values are strings
          'month': entry['month'].toString(),
          'category': entry['category'].toString(),
        };
      }).toList();
    });
  }

  List<String> getDatesInRange(String start, String end) {
    List<String> dates = [];
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateTime startDate = dateFormat.parse(start);
    DateTime endDate = dateFormat.parse(end);

    for (DateTime date = startDate;
        date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
        date = date.add(const Duration(days: 1))) {
      dates.add(dateFormat.format(date));
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    double hintSize = 12;
    double buttonSize = 15;
    double tabhint = 18;
    double tabPadding = 80;
    if (context.locale.languageCode == 'en') {
      hintSize = 15;
      buttonSize = 13;
      tabhint = 20;
      tabPadding = 70;
    } else if (context.locale.languageCode == 'ml') {
      hintSize = 13;
      buttonSize = 12;
      tabhint = 18;
      tabPadding = 30;
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.bgBlue,
          appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
              backgroundColor: ColorConstant.defIndigo,
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
              title: MediaQuery.of(context).size.width < 600
                  ? Text(
                      "budget_goal_screen.budget_goal_title".tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
                      "budget_goal_screen.budget_goal_title".tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
          body: ResponsiveWidget(
            mobile: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30,
                            ),
                            underline: Container(),
                            value: dropDownValue,
                            items: numbers
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30, left: 10),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                dropDownValue = value!;
                              });
                            },
                          ),
                        ),
                        Container(
                          // WEEK or MONTH Selection
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30,
                            ),
                            underline: Container(),
                            value: dropDownMonthOrWeekValue,
                            items: MonthOrWeek.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 40, left: 10),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                dropDownMonthOrWeekValue = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ), // first row dropdown
                    const SizedBox(
                      height: 20,
                    ),
                    if (dropDownMonthOrWeekValue ==
                        "budget_goal_screen.dropdowns.monthly".tr()) ...[
                      //Mothly dropdowns
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButton<String>(
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                                size: 30,
                              ),
                              underline: Container(),
                              value: dropDownMonthValue,
                              items: months.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  dropDownMonthValue = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Consumer<CategoryProvider>(
                              builder: (context, categoryProvider, child) {
                                // Check if categories are available
                                bool categoriesAvailable =
                                    categoryProvider.categories.isNotEmpty;
                                // Set the initial dropdown value
                                // String categorydropdownValue =
                                //     categoriesAvailable
                                //         ? categoryProvider.categories[0].title
                                //         : 'No categories available';
                                String? categoryValue = categoriesAvailable
                                    ? (categoryProvider.categories
                                            .map((category) => category.title)
                                            .contains(selectedCategory)
                                        ? selectedCategory
                                        : categoryProvider.categories[0].title)
                                    : 'No categories available';

                                return categoriesAvailable
                                    ? DropdownButton<String>(
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        underline: Container(),
                                        value: categoryValue,
                                        items: categoriesAvailable
                                            ? categoryProvider.categories
                                                .map<DropdownMenuItem<String>>(
                                                    (category) {
                                                return DropdownMenuItem<String>(
                                                  value: category.title,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 40,
                                                            left: 10),
                                                    child: Text(
                                                      category.title,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList()
                                            : [
                                                DropdownMenuItem<String>(
                                                  value: 'Add categories',
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const CategoriesScreen(),
                                                            ));
                                                      },
                                                      child: const Text(
                                                        'Add categories',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],

                                        onChanged: categoriesAvailable
                                            ? (String? value) {
                                                setState(() {
                                                  //categorydropdownValue = value!;
                                                  selectedCategory = value!;
                                                });
                                              }
                                            : null, // Disable the dropdown if no categories are available
                                      )
                                    : Center(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const CategoriesScreen(),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Add categories',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      );
                              },
                            ),
                          ), //ADDED CATEGORY SCREEN ADDED CATEGORIES DISPLAY ON BUDGET GOAL SCREEN
                        ],
                      ),
                    ] else if (dropDownMonthOrWeekValue ==
                        "budget_goal_screen.dropdowns.weekly".tr()) ...[
                      //the extra dropdowns for weekly
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextField(
                              controller: startDateController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: hintSize),
                                  hintText:
                                      "budget_goal_screen.hints.startDate".tr(),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10)),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await _selectDate(context, startDateController);
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextField(
                              controller: endDateController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(fontSize: hintSize),
                                  hintText:
                                      "budget_goal_screen.hints.endDate".tr(),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10)),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await _selectDate(context, endDateController);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 50,
                          width: 320,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Consumer<CategoryProvider>(
                            builder: (context, categoryProvider, child) {
                              // Check if categories are available
                              bool categoriesAvailable =
                                  categoryProvider.categories.isNotEmpty;
                              // Set the initial dropdown value
                              // String categorydropdownValue = categoriesAvailable
                              //     ? categoryProvider.categories[0].title
                              //     : 'Add categories';
                              String? categoryValue = categoriesAvailable
                                  ? (categoryProvider.categories
                                          .map((category) => category.title)
                                          .contains(selectedCategory)
                                      ? selectedCategory
                                      : categoryProvider.categories[0].title)
                                  : 'No categories available';

                              return categoriesAvailable
                                  ? DropdownButton<String>(
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      underline: Container(),
                                      value: categoryValue,
                                      items: categoriesAvailable
                                          ? categoryProvider.categories
                                              .map<DropdownMenuItem<String>>(
                                                  (category) {
                                              return DropdownMenuItem<String>(
                                                value: category.title,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 150, left: 10),
                                                  child: Text(
                                                    category.title,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList()
                                          : [
                                              DropdownMenuItem<String>(
                                                value: 'Add categories',
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const CategoriesScreen(),
                                                          ));
                                                    },
                                                    child: const Text(
                                                      'Add categories',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                      onChanged: categoriesAvailable
                                          ? (String? value) {
                                              List<Category> categoryList =
                                                  categoryProvider.categories;
                                              setState(() {
                                                //categorydropdownValue = value!;

                                                for (int i = 0;
                                                    i < categoryList.length;
                                                    i++) {
                                                  //iterating over the categry list
                                                  if (categoryList[i]
                                                          .title
                                                          .compareTo(value
                                                              .toString()) ==
                                                      0) {
                                                    selectedCategory =
                                                        categoryList[i]
                                                            .id
                                                            .toString();
                                                    break;
                                                  } //checking if the title is alrdy in the table
                                                }
                                              });
                                            }
                                          : null,
                                    )
                                  : Center(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const CategoriesScreen(),
                                              ),
                                            );
                                          },
                                          child: const Text("Add Category")),
                                    );
                            },
                          ) //ADDED CATEGORY SCREEN ADDED CATEGORIES DISPLAY ON BUDGET GOAL SCREEN

                          ),
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "budget_goal_screen.hints.enterAmount".tr(),
                            hintStyle: const TextStyle(fontSize: 13),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // setState(() {
                        //   String enteredAmount = amountController.text;
                        //   if (dropDownMonthOrWeekValue == 'Monthly') {
                        //     enteredvalues.add({
                        //       "amount": enteredAmount,
                        //       "month": "$dropDownMonthValue  $dropDownValue",
                        //       "category": selectedCategory,
                        //     });
                        //     dropDownMonthValue =
                        //         "budget_goal_screen.dropdowns.month_selection"
                        //             .tr();
                        //     dropDownValue =
                        //         "budget_goal_screen.dropdowns.year_selection"
                        //             .tr();
                        //   } else if (dropDownMonthOrWeekValue == 'Weekly') {
                        //     List<String> dates = getDatesInRange(
                        //         startDateController.text,
                        //         endDateController.text);
                        //     for (String date in dates) {
                        //       enteredvalues.add({
                        //         "amount": enteredAmount,
                        //         "month": date,
                        //         "category": selectedCategory,
                        //       });
                        //     }
                        //     startDateController.clear();
                        //     endDateController.clear();
                        //   }
                        //   amountController
                        //       .clear(); // Clear the text field after submission

                        // });
                        setState(() async {
                          String enteredAmount = amountController.text;
                          String startDate = startDateController.text;
                          String endDate = endDateController.text;
                          String monthMessage = '';
                          String weekMessage = '';
                          if (dropDownMonthOrWeekValue == 'Monthly') {
                            if (enteredAmount.isEmpty) {
                              monthMessage += ' Amount,';
                            }
                            if (dropDownMonthValue ==
                                "budget_goal_screen.dropdowns.month_selection"
                                    .tr()) {
                              monthMessage += ' Month,';
                            }
                            if (dropDownValue ==
                                "budget_goal_screen.dropdowns.year_selection"
                                    .tr()) {
                              monthMessage += ' Year';
                            }
                            if (selectedCategory == "") {
                              monthMessage += ' category';
                            }
                            if (monthMessage.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Please Add the " + monthMessage.trim(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            } else {
                              Map<String, String> entry = {
                                "amount": enteredAmount,
                                "month": "$dropDownMonthValue $dropDownValue",
                                "category": selectedCategory,
                              };
                              await tableDb.insertEntry(entry);
                              fetchData();
                              setState(() {
                                enteredvalues.add(entry);
                                dropDownMonthValue =
                                    "budget_goal_screen.dropdowns.month_selection"
                                        .tr();
                                dropDownValue =
                                    "budget_goal_screen.dropdowns.year_selection"
                                        .tr();
                              });
                              amountController.clear();
                            }
                          } else if (dropDownMonthOrWeekValue == 'Weekly') {
                            if (enteredAmount.isEmpty) {
                              weekMessage += ' Amount,';
                            }
                            if (startDate.isEmpty) {
                              weekMessage += ' Start Date,';
                            }
                            if (endDate.isEmpty) {
                              weekMessage += 'End Date';
                            }
                            if (selectedCategory == null) {
                              weekMessage += ' Category';
                            }
                            if (weekMessage.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Please Add the " + weekMessage.trim(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            } else {
                              List<String> dates = getDatesInRange(
                                  startDateController.text,
                                  endDateController.text);
                              for (String date in dates) {
                                Map<String, String> entry = {
                                  "amount": enteredAmount,
                                  "month": date,
                                  "category": selectedCategory,
                                };

                                await tableDb.insertEntry(entry);
                                fetchData();

                                setState(() {
                                  enteredvalues.add(entry);
                                });
                              }
                              startDateController.clear();
                              endDateController.clear();
                            }
                            amountController
                                .clear(); // Clear the text field after submission
                          }
                        });
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
                            "budget_goal_screen.buttons.submit".tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    enteredvalues.isEmpty
                        ? const Center(
                            child: Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Text("No Data Available"),
                          ))
                        : DataTable(
                            dataRowMaxHeight: 60,
                            columnSpacing: 25,
                            border:
                                TableBorder.all(color: Colors.grey, width: 0.5),
                            columns: [
                              DataColumn(
                                  label: Text(
                                dropDownMonthOrWeekValue ==
                                        "budget_goal_screen.dropdowns.monthly"
                                            .tr()
                                    ? "budget_goal_screen.tableHeaders.month"
                                        .tr()
                                    : "budget_goal_screen.tableHeaders.date"
                                        .tr(), //changed table date column according to week or month selection
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13),
                              )),
                              DataColumn(
                                  label: Text(
                                'budget_goal_screen.tableHeaders.category'.tr(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13),
                              )),
                              DataColumn(
                                  label: InkWell(
                                onTap: () {},
                                child: Text(
                                  'budget_goal_screen.tableHeaders.amount'.tr(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13),
                                ),
                              )),
                              DataColumn(
                                  label: InkWell(
                                onTap: () {},
                                child: Text(
                                  'budget_goal_screen.tableHeaders.action'.tr(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13),
                                ),
                              )),
                            ],
                            rows: enteredvalues.map<DataRow>((entry) {
                              return DataRow(cells: [
                                DataCell(Text(entry['month'] ?? '')),
                                DataCell(Text(entry['category'] ?? '')),
                                DataCell(Text(entry['amount'] ?? '')),
                                DataCell(Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        /////////////////FOR EDIT DIALOG
                                        onTap: () {
                                          //editDialog();
                                          _showEditDialog(entry,
                                              enteredvalues.indexOf(entry));
                                        },
                                        child: Text(
                                          'budget_goal_screen.buttons.edit'
                                              .tr(),
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: buttonSize),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Container(
                                            height: 200,
                                            child: AlertDialog(
                                              title: Text(
                                                "budget_goal_screen.DeletMsg"
                                                    .tr(),
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
                                                    "budget_goal_screen.No"
                                                        .tr(),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    String amountToDelete =
                                                        entry['amount']!;
                                                    String monthToDelete =
                                                        entry['month']!;
                                                    String categoryToDelete =
                                                        entry['category']!;

                                                    await tableDb.deleteEntry(
                                                        amountToDelete,
                                                        monthToDelete,
                                                        categoryToDelete);
                                                    fetchData();

                                                    setState(() {
                                                      enteredvalues.remove(
                                                          entry); // Remove the selected entry
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "budget_goal_screen.Yes"
                                                        .tr(),
                                                    style: const TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                        ////
                                        // setState(() {
                                        //   enteredvalues.remove(
                                        //     entry,
                                        //   ); // Remove the selected entry
                                        // });
                                      },
                                      child: Text(
                                        'budget_goal_screen.buttons.delete'
                                            .tr(),
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: buttonSize),
                                      ),
                                    )
                                  ],
                                )),
                              ]);
                            }).toList(),
                          ),
                  ],
                ),
              ),
            ),
            //FOR TAB
            tab: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 250,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30,
                            ),
                            underline: Container(),
                            value: dropDownValue,
                            items: numbers
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                dropDownValue = value!;
                              });
                            },
                          ),
                        ),
                        Container(
                          // WEEK or MONTH Selection
                          alignment: Alignment.center,
                          height: 70,
                          width: 250,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 30,
                            ),
                            underline: Container(),
                            value: dropDownMonthOrWeekValue,
                            items: MonthOrWeek.map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                dropDownMonthOrWeekValue = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ), // first row dropdown
                    const SizedBox(
                      height: 30,
                    ),
                    if (dropDownMonthOrWeekValue ==
                        "budget_goal_screen.dropdowns.monthly".tr()) ...[
                      //Mothly dropdowns
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButton<String>(
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                                size: 30,
                              ),
                              underline: Container(),
                              value: dropDownMonthValue,
                              items: months.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  dropDownMonthValue = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: 250,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Consumer<CategoryProvider>(
                                builder: (context, categoryProvider, child) {
                                  // Check if categories are available
                                  bool categoriesAvailable =
                                      categoryProvider.categories.isNotEmpty;
                                  // Set the initial dropdown value
                                  String categorydropdownValue =
                                      categoriesAvailable
                                          ? categoryProvider.categories[0].title
                                          : 'Add categories';

                                  return DropdownButton<String>(
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    underline: Container(),
                                    value: selectedCategory,
                                    items: categoriesAvailable
                                        ? categoryProvider.categories
                                            .map<DropdownMenuItem<String>>(
                                                (category) {
                                            return DropdownMenuItem<String>(
                                              value: category.title,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  category.title,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 23,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList()
                                        : [
                                            DropdownMenuItem<String>(
                                              value: 'Add categories',
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CategoriesScreen(),
                                                        ));
                                                  },
                                                  child: const Text(
                                                    'Add categories',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 23,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                    onChanged: categoriesAvailable
                                        ? (String? value) {
                                            setState(() {
                                              categorydropdownValue = value!;
                                              selectedCategory = value;
                                            });
                                          }
                                        : null, // Disable the dropdown if no categories are available
                                  );
                                },
                              ) //ADDED CATEGORY SCREEN  CATEGORIES DISPLAY ON BUDGET GOAL SCREEN FOR TAB IN MONTHLY
                              ),
                        ],
                      ),
                    ] else if (dropDownMonthOrWeekValue ==
                        "budget_goal_screen.dropdowns.weekly".tr()) ...[
                      //the extra dropdowns for weekly
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextField(
                              controller: startDateController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    "budget_goal_screen.hints.startDate".tr(),
                                hintStyle: TextStyle(fontSize: tabhint),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: tabPadding),
                              ),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await _selectDate(context, startDateController);
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 250,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextField(
                              controller: endDateController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    "budget_goal_screen.hints.endDate".tr(),
                                hintStyle: TextStyle(fontSize: tabhint),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: tabPadding),
                              ),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await _selectDate(context, endDateController);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 423,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Consumer<CategoryProvider>(
                            builder: (context, categoryProvider, child) {
                              // Check if categories are available
                              bool categoriesAvailable =
                                  categoryProvider.categories.isNotEmpty;
                              // Set the initial dropdown value
                              String categorydropdownValue = categoriesAvailable
                                  ? categoryProvider.categories[0].title
                                  : 'Add categories';

                              return DropdownButton<String>(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                underline: Container(),
                                value: selectedCategory,
                                items: categoriesAvailable
                                    ? categoryProvider.categories
                                        .map<DropdownMenuItem<String>>(
                                            (category) {
                                        return DropdownMenuItem<String>(
                                          value: category.title,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              category.title,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList()
                                    : [
                                        DropdownMenuItem<String>(
                                          value: 'Add categories',
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CategoriesScreen(),
                                                    ));
                                              },
                                              child: const Text(
                                                'Add categories',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                onChanged: categoriesAvailable
                                    ? (String? value) {
                                        setState(() {
                                          categorydropdownValue = value!;
                                          selectedCategory = value;
                                        });
                                      }
                                    : null, // Disable the dropdown if no categories are available
                              );
                            },
                          ) //ADDED CATEGORY SCREEN  CATEGORIES DISPLAY ON BUDGET GOAL SCREEN for TAB ACCORDING TO WEEKLY
                          ),
                    ],
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 70,
                      width: 423,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: amountController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "budget_goal_screen.hints.enterAmount".tr(),
                          hintStyle: const TextStyle(fontSize: 20),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: context.locale.languageCode == 'en'
                                  ? 130
                                  : 100),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          String enteredAmount = amountController.text;
                          if (dropDownMonthOrWeekValue == 'Monthly') {
                            enteredvalues.add({
                              "amount": enteredAmount,
                              "month": "$dropDownMonthValue  $dropDownValue",
                              "category": selectedCategory,
                            });
                            dropDownMonthValue =
                                "budget_goal_screen.dropdowns.month_selection"
                                    .tr();
                            dropDownValue =
                                "budget_goal_screen.dropdowns.year_selection"
                                    .tr();
                          } else if (dropDownMonthOrWeekValue == 'Weekly') {
                            List<String> dates = getDatesInRange(
                                startDateController.text,
                                endDateController.text);
                            for (String date in dates) {
                              enteredvalues.add({
                                "amount": enteredAmount,
                                "month": date,
                                "category": selectedCategory,
                              });
                            }
                            startDateController.clear();
                            endDateController.clear();
                          }
                          amountController
                              .clear(); // Clear the text field after submission
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                          color: ColorConstant.defIndigo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "budget_goal_screen.buttons.submit".tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    enteredvalues.isEmpty
                        ? const Center(
                            child: Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Text("No Data Available"),
                          ))
                        : DataTable(
                            headingRowHeight: 70,
                            dataRowMaxHeight: 100,
                            columnSpacing: 100,
                            border:
                                TableBorder.all(color: Colors.grey, width: 1),
                            columns: [
                              DataColumn(
                                  label: Text(
                                dropDownMonthOrWeekValue ==
                                        "budget_goal_screen.dropdowns.monthly"
                                            .tr()
                                    ? "budget_goal_screen.tableHeaders.month"
                                        .tr()
                                    : "budget_goal_screen.tableHeaders.date"
                                        .tr(), //changed tab table date column according to week or month selection
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                              )),
                              DataColumn(
                                  label: Text(
                                'budget_goal_screen.tableHeaders.category'.tr(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                              )),
                              DataColumn(
                                  label: Text(
                                'budget_goal_screen.tableHeaders.amount'.tr(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                              )),
                              DataColumn(
                                  label: Text(
                                'budget_goal_screen.tableHeaders.action'.tr(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                              )),
                            ],
                            rows: enteredvalues.map<DataRow>((entry) {
                              return DataRow(cells: [
                                DataCell(Text(
                                  entry['month'] ?? '',
                                  style: const TextStyle(fontSize: 18),
                                )),
                                DataCell(Text(
                                  entry['category'] ?? '',
                                  style: const TextStyle(fontSize: 18),
                                )),
                                DataCell(Text(
                                  entry['amount'] ?? '',
                                  style: const TextStyle(fontSize: 18),
                                )),
                                DataCell(Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          _showEditDialog(entry,
                                              enteredvalues.indexOf(entry));
                                        },
                                        child: Text(
                                          'budget_goal_screen.buttons.edit'
                                              .tr(),
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'budget_goal_screen.buttons.delete'.tr(),
                                      style: const TextStyle(
                                          color: Colors.red, fontSize: 18),
                                    )
                                  ],
                                )),
                              ]);
                            }).toList(),
                          ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  ///NEW function FOR EDITING PURPOSE/////////////////

  void _showEditDialog(Map<String, String> entry, int index) async {
    final categoryprovider =
        Provider.of<CategoryProvider>(context, listen: false);
    final TextEditingController amountController =
        TextEditingController(text: entry['amount']);
    final TextEditingController startDateController =
        TextEditingController(text: entry['month']);
    String categoryId = entry['category'] ?? '';
    List<Category> abc = await categoryprovider.categoryById(categoryId);
    String selectedCategory = "";
    if (abc.length > 0) {
      selectedCategory = abc[0].id.toString(); //////////
    }

    String editMonthValue = '';
    String editYearValue = '';
    bool isMonthly = entry['month']!.contains(' ');

    if (isMonthly) {
      editMonthValue = entry['month']!.split(' ')[0];
      editYearValue = entry['month']!.split(' ')[1];
    } else {
      startDateController.text = entry['month']!;
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Edit your Budget Goal",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorConstant.defIndigo,
              ),
            ),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (dropDownMonthOrWeekValue == 'Monthly') ...[
                    !isMonthly
                        ? Container(
                            height: MediaQuery.of(context).size.width < 600
                                ? 50
                                : 70,
                            width: MediaQuery.of(context).size.width < 600
                                ? 250
                                : 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: startDateController,
                                decoration: const InputDecoration(
                                    hintText: "Start Date",
                                    border: InputBorder.none),
                                onTap: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  DateTime? selectedDate = await _selectDate(
                                      context, startDateController);
                                  if (selectedDate != null) {
                                    setState(() {
                                      startDateController.text =
                                          selectedDate.toString().split(' ')[0];
                                    });
                                  }
                                },
                              ),
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.width < 600
                                ? 50
                                : 70,
                            width: MediaQuery.of(context).size.width < 600
                                ? 250
                                : 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: DropdownButton<String>(
                              underline: Container(),
                              value: editMonthValue,
                              items: months.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  editMonthValue = newValue!;
                                });
                              },
                            ),
                          ),
                    const SizedBox(height: 20),
                    isMonthly
                        ? Container(
                            height: MediaQuery.of(context).size.width < 600
                                ? 50
                                : 70,
                            width: MediaQuery.of(context).size.width < 600
                                ? 250
                                : 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: DropdownButton<String>(
                              underline: Container(),
                              value: editYearValue,
                              items: numbers.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  editYearValue = newValue!;
                                });
                              },
                            ),
                          )
                        : const Text("")
                  ] else if (dropDownMonthOrWeekValue == 'Weekly') ...[
                    Container(
                      height: MediaQuery.of(context).size.width < 600 ? 50 : 70,
                      width:
                          MediaQuery.of(context).size.width < 600 ? 250 : 300,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: startDateController,
                          decoration: const InputDecoration(
                              hintText: "Start Date", border: InputBorder.none),
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            await _selectDate(context, startDateController);
                          },
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.width < 600 ? 50 : 70,
                    width: MediaQuery.of(context).size.width < 600 ? 250 : 300,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Amount",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Consumer<CategoryProvider>(
                    builder: (context, categoryProvider, child) {
                      bool categoriesAvailable =
                          categoryProvider.categories.isNotEmpty;
                      return Container(
                        height:
                            MediaQuery.of(context).size.width < 600 ? 50 : 70,
                        width:
                            MediaQuery.of(context).size.width < 600 ? 250 : 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: DropdownButton<String>(
                          underline: Container(),
                          value: selectedCategory,
                          items: categoriesAvailable
                              ? categoryProvider.categories.map((category) {
                                  return DropdownMenuItem<String>(
                                    value: category.title,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(category.title),
                                    ),
                                  );
                                }).toList()
                              : [
                                  DropdownMenuItem<String>(
                                    value: 'Add categories',
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const CategoriesScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text('Add categories'),
                                    ),
                                  ),
                                ],
                          onChanged: categoriesAvailable
                              ? (String? value) {
                                  List<Category> categoryList =
                                      categoryProvider.categories;
                                  setState(() {
                                    //categorydropdownValue = value!;

                                    for (int i = 0;
                                        i < categoryList.length;
                                        i++) {
                                      //iterating over the categry list
                                      if (categoryList[i]
                                              .title
                                              .compareTo(value.toString()) ==
                                          0) {
                                        selectedCategory =
                                            categoryList[i].id.toString();
                                        break;
                                      } //checking if the title is alrdy in the table
                                    }
                                  });
                                }
                              : null,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width < 600 ? 18 : 30),
              ),
            ),
            TextButton(
              onPressed: () async {
                Map<String, String> updatedEntry = {
                  'amount': amountController.text,
                  'month': dropDownMonthOrWeekValue == 'Monthly'
                      ? "$editMonthValue $editYearValue"
                      : startDateController.text,
                  'category': selectedCategory,
                };
                int idToUpdate = index + 1;
                await TableDb().updateEntry(idToUpdate, updatedEntry);
                setState(() {
                  // Update local UI state
                  enteredvalues[index] = updatedEntry;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                "Save",
                style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width < 600 ? 18 : 30),
              ),
            ),
          ],
        );
      },
    );
  }
}
