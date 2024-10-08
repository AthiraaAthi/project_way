import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/controller/category_provider.dart';
import 'package:project_way/database/category_db/category_db.dart';
import 'package:project_way/database/table_db/table_db.dart';

import 'package:project_way/model/category_model.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/model/category_model.dart' as DbCategory;
import 'package:project_way/view/screen/responsive.dart';

class BudgetGoal2 extends StatefulWidget {
  const BudgetGoal2({super.key});

  @override
  State<BudgetGoal2> createState() => _BudgetGoal2State();
}

class _BudgetGoal2State extends State<BudgetGoal2> {
  List<String> years = [
    // for year
    "budget_goal_screen.dropdowns.year_selection".tr(),
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

  List<Map<String, dynamic>> enteredvalues = [];
  int? editingIndex;
  String selectedCategory = "Select category";

  List<String> categoryTitle = [];
  final List<String> categoryDropdown = [
    'Select category',
    'Option 1',
    'Option 2',
    'Option 3',
    // Add more items here
  ];
  String categoryId = "0";

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

  String monthly = '0';
  String weekly = '1';
  List<Category> listCategory = [];
  TableDb tableDb = TableDb();

  @override
  void initState() {
    super.initState();
    createDynamicYear();
    categoryFetch();
    fetchData();
  }

  createDynamicYear() {
    //creating object of datetime
    DateTime now = new DateTime.now();
    for (int i = 0; i < 6; i++) {
      int curentYear = now.year;
      curentYear = curentYear + i;

      setState(() {
        years.add(curentYear.toString());
      });
    }
  } //for creating year without a static list

  categoryFetch() async {
    categoryTitle.clear();
    categoryTitle.add(selectedCategory);
    CategoryDatabase categoryDb = CategoryDatabase();

    List<Category> categoryList = await categoryDb.getCategories();

    print(categoryList.length);
    setState(() {
      listCategory.clear();
      listCategory.addAll(categoryList);

      for (int i = 0; i < categoryList.length; i++) {
        categoryTitle.add(categoryList[i].title); //for dropdown
      }
    });
  }

  fetchData() async {
    List<Map<String, dynamic>> entries = await tableDb.getAllEntries();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(entries.toString())));
    print(entries);

    setState(() {
      enteredvalues = entries.map((entry) {
        return {
          'year': entry['year'],
          "id": entry["id"],
          'budgetType': entry['budgetType'],
          'month': entry['month'],
          'StartDate': entry['StartDate'],
          'endDate': entry['endDate'],
          'categoryId': entry['categoryId'],
          'amount': entry['amount'], // Ensure values are strings
          'category': entry['category'],
        };
      }).toList();
    });
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
    return Scaffold(
        backgroundColor: ColorConstant.bgBlue,
        appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
            backgroundColor: ColorConstant.defIndigo,
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
            title: Text(
              "budget_goal_screen.budget_goal_title".tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width < 600 ? 18 : 30,
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
                          items: years
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, left: 10),
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
                                padding:
                                    const EdgeInsets.only(right: 40, left: 10),
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
                  ),
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
                            items: months
                                .map<DropdownMenuItem<String>>((String value) {
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DropdownButton<String>(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                underline: Container(),
                                value: selectedCategory,
                                items: categoryTitle.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCategory = newValue!;

                                    for (int i = 0;
                                        i < listCategory.length;
                                        i++) {
                                      if (listCategory[i]
                                              .title
                                              .compareTo(selectedCategory) ==
                                          0) {
                                        //if selected category&db categorytitle is same
                                        categoryId = listCategory[i]
                                            .id
                                            .toString(); //to store categoryId
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("$categoryId"),
                                          duration: Duration(seconds: 2),
                                        ));
                                        break;
                                      }
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
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
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextField(
                            controller: startDateController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 15),
                                hintText:
                                    "budget_goal_screen.hints.startDate".tr(),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
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
                                hintStyle: TextStyle(fontSize: 15),
                                hintText:
                                    "budget_goal_screen.hints.endDate".tr(),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10)),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
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
                      child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 30,
                        ),
                        underline: Container(),
                        value: selectedCategory,
                        items: categoryTitle.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 120, left: 10),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;

                            for (int i = 0; i < listCategory.length; i++) {
                              if (listCategory[i]
                                      .title
                                      .compareTo(selectedCategory) ==
                                  0) {
                                //if selected category&db categorytitle is same
                                categoryId = listCategory[i]
                                    .id
                                    .toString(); //to store categoryId
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("$categoryId"),
                                  duration: Duration(seconds: 2),
                                ));
                                break;
                              }
                            }
                          });
                        },
                      ),
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
                          hintText: "budget_goal_screen.hints.enterAmount".tr(),
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
                      setState(() async {
                        String enteredAmount = amountController.text;
                        String startDate = startDateController.text;
                        String endDate = endDateController.text;
                        String monthMessage = '';
                        String weekMessage = '';
                        if (dropDownMonthOrWeekValue ==
                            "budget_goal_screen.dropdowns.monthly".tr()) {
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
                          if (selectedCategory == "'Select category'") {
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
                            Map<String, dynamic> entry = {
                              "year": dropDownValue,
                              "budgetType": monthly,
                              "month": dropDownMonthValue,
                              "StartDate": "",
                              "endDate": "",
                              "categoryId": categoryId,
                              "amount": enteredAmount,
                              "category": selectedCategory,
                            };

                            await tableDb.insertEntry(entry);
                            fetchData();
                            print('Inserting entry: $entry');

                            setState(() {
                              enteredvalues.add(entry);
                              dropDownMonthValue =
                                  "budget_goal_screen.dropdowns.month_selection"
                                      .tr();
                              dropDownValue =
                                  "budget_goal_screen.dropdowns.year_selection"
                                      .tr();
                            });
                          }
                          amountController.clear();
                          selectedCategory = "Select category";
                        } else if (dropDownMonthOrWeekValue ==
                            "budget_goal_screen.dropdowns.weekly".tr()) {
                          if (enteredAmount.isEmpty) {
                            weekMessage += ' Amount,';
                          }
                          if (startDate.isEmpty) {
                            weekMessage += ' Start Date,';
                          }
                          if (endDate.isEmpty) {
                            weekMessage += 'End Date';
                          }
                          if (selectedCategory == "Select category") {
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
                              Map<String, dynamic> entry = {
                                "year": "",
                                "budgetType": weekly,
                                "month": "",
                                "StartDate": date,
                                "endDate": date,
                                "categoryId": categoryId,
                                "amount": enteredAmount,
                                "category": selectedCategory,
                              };
                              await tableDb.insertEntry(entry);
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
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Text("No Data Available"),
                          ),
                        )
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
                                  ? "budget_goal_screen.tableHeaders.month".tr()
                                  : "budget_goal_screen.tableHeaders.date".tr(),
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
                                label: Text(
                              'budget_goal_screen.tableHeaders.amount'.tr(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13),
                            )),
                            DataColumn(
                                label: Text(
                              'budget_goal_screen.tableHeaders.action'.tr(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13),
                            )),
                          ],
                          rows: enteredvalues.map<DataRow>((entry) {
                            return DataRow(cells: [
                              DataCell(
                                entry['budgetType'] == monthly
                                    ? Text('${entry['month']} ${entry['year']}')
                                    : Text(entry['StartDate']),
                              ),
                              DataCell(Text(entry['category'] ?? '')),
                              DataCell(Text(entry['amount'] ?? '')),
                              DataCell(Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      /////////////////FOR EDIT DIALOG
                                      onTap: () {
                                        _showEditDialog(entry,
                                            enteredvalues.indexOf(entry));
                                      },
                                      child: Text(
                                        'budget_goal_screen.buttons.edit'.tr(),
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 15),
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
                                                  "budget_goal_screen.No".tr(),
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  // ScaffoldMessenger.of(context)
                                                  //     .showSnackBar(SnackBar(
                                                  //         content: Text(
                                                  //             "the id for for deleting :$entry")));
                                                  await tableDb.deleteEntry(
                                                      entry['id'].toString());
                                                  fetchData();
                                                  setState(() {
                                                    enteredvalues.remove(
                                                        entry); // Remove the selected entry
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "budget_goal_screen.Yes".tr(),
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'budget_goal_screen.buttons.delete'.tr(),
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 15),
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
          tab: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
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
                            size: 40,
                          ),
                          underline: Container(),
                          value: dropDownValue,
                          items: years
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 50, left: 10),
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
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
                            size: 40,
                          ),
                          underline: Container(),
                          value: dropDownMonthOrWeekValue,
                          items: MonthOrWeek.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 40, left: 10),
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
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
                  ),
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
                          height: 70,
                          width: 250,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 40,
                            ),
                            underline: Container(),
                            value: dropDownMonthValue,
                            items: months
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
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
                          height: 70,
                          width: 250,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DropdownButton<String>(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                underline: Container(),
                                value: selectedCategory,
                                items: categoryTitle.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 25),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCategory = newValue!;

                                    for (int i = 0;
                                        i < listCategory.length;
                                        i++) {
                                      if (listCategory[i]
                                              .title
                                              .compareTo(selectedCategory) ==
                                          0) {
                                        //if selected category&db categorytitle is same
                                        categoryId = listCategory[i]
                                            .id
                                            .toString(); //to store categoryId
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("$categoryId"),
                                          duration: Duration(seconds: 2),
                                        ));
                                        break;
                                      }
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
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
                          height: 70,
                          width: 250,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextField(
                            style: TextStyle(fontSize: 22),
                            controller: startDateController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 22),
                                hintText:
                                    "budget_goal_screen.hints.startDate".tr(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: tabPadding)),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              await _selectDate(context, startDateController);
                            },
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 250,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: TextField(
                            style: TextStyle(fontSize: 22),
                            controller: endDateController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 22),
                                hintText:
                                    "budget_goal_screen.hints.endDate".tr(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: tabPadding)),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
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
                      height: 70,
                      width: 580,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 40,
                        ),
                        underline: Container(),
                        value: selectedCategory,
                        items: categoryTitle.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 120, left: 10),
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;

                            for (int i = 0; i < listCategory.length; i++) {
                              if (listCategory[i]
                                      .title
                                      .compareTo(selectedCategory) ==
                                  0) {
                                //if selected category&db categorytitle is same
                                categoryId = listCategory[i]
                                    .id
                                    .toString(); //to store categoryId
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("$categoryId"),
                                  duration: Duration(seconds: 2),
                                ));
                                break;
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 580,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: TextField(
                        style: TextStyle(fontSize: 25),
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "budget_goal_screen.hints.enterAmount".tr(),
                          hintStyle: const TextStyle(
                            fontSize: 25,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal:
                                context.locale.languageCode == 'en' ? 180 : 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() async {
                        String enteredAmount = amountController.text;
                        String startDate = startDateController.text;
                        String endDate = endDateController.text;
                        String monthMessage = '';
                        String weekMessage = '';
                        if (dropDownMonthOrWeekValue ==
                            "budget_goal_screen.dropdowns.monthly".tr()) {
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
                          if (selectedCategory == "'Select category'") {
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
                            Map<String, dynamic> entry = {
                              "year": dropDownValue,
                              "budgetType": monthly,
                              "month": dropDownMonthValue,
                              "StartDate": "",
                              "endDate": "",
                              "categoryId": categoryId,
                              "amount": enteredAmount,
                              "category": selectedCategory,
                            };

                            await tableDb.insertEntry(entry);
                            fetchData();
                            print('Inserting entry: $entry');

                            setState(() {
                              enteredvalues.add(entry);
                              dropDownMonthValue =
                                  "budget_goal_screen.dropdowns.month_selection"
                                      .tr();
                              dropDownValue =
                                  "budget_goal_screen.dropdowns.year_selection"
                                      .tr();
                            });
                          }
                          amountController.clear();
                          selectedCategory = "Select category";
                        } else if (dropDownMonthOrWeekValue ==
                            "budget_goal_screen.dropdowns.weekly".tr()) {
                          if (enteredAmount.isEmpty) {
                            weekMessage += ' Amount,';
                          }
                          if (startDate.isEmpty) {
                            weekMessage += ' Start Date,';
                          }
                          if (endDate.isEmpty) {
                            weekMessage += 'End Date';
                          }
                          if (selectedCategory == "Select category") {
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
                              Map<String, dynamic> entry = {
                                "year": "",
                                "budgetType": weekly,
                                "month": "",
                                "StartDate": date,
                                "endDate": date,
                                "categoryId": categoryId,
                                "amount": enteredAmount,
                                "category": selectedCategory,
                              };
                              await tableDb.insertEntry(entry);
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
                      height: 70,
                      width: 350,
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
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  enteredvalues.isEmpty
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Text("No Data Available"),
                          ),
                        )
                      : DataTable(
                          dataRowMaxHeight: 100,
                          columnSpacing: 100,
                          border:
                              TableBorder.all(color: Colors.grey, width: 0.5),
                          columns: [
                            DataColumn(
                                label: Text(
                              dropDownMonthOrWeekValue ==
                                      "budget_goal_screen.dropdowns.monthly"
                                          .tr()
                                  ? "budget_goal_screen.tableHeaders.month".tr()
                                  : "budget_goal_screen.tableHeaders.date".tr(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 23),
                            )),
                            DataColumn(
                                label: Text(
                              'budget_goal_screen.tableHeaders.category'.tr(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 23),
                            )),
                            DataColumn(
                                label: Text(
                              'budget_goal_screen.tableHeaders.amount'.tr(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 23),
                            )),
                            DataColumn(
                                label: Text(
                              'budget_goal_screen.tableHeaders.action'.tr(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 23),
                            )),
                          ],
                          rows: enteredvalues.map<DataRow>((entry) {
                            return DataRow(cells: [
                              DataCell(
                                entry['budgetType'] == monthly
                                    ? Text(
                                        '${entry['month']} ${entry['year']}',
                                        style: const TextStyle(fontSize: 22),
                                      )
                                    : Text(
                                        entry['StartDate'],
                                        style: const TextStyle(fontSize: 22),
                                      ),
                              ),
                              DataCell(
                                Text(
                                  entry['category'] ?? '',
                                  style: const TextStyle(fontSize: 22),
                                ),
                              ),
                              DataCell(Text(
                                entry['amount'] ?? '',
                                style: const TextStyle(fontSize: 22),
                              )),
                              DataCell(Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      /////////////////FOR EDIT DIALOG
                                      onTap: () {
                                        _showEditDialog(entry,
                                            enteredvalues.indexOf(entry));
                                      },
                                      child: Text(
                                        'budget_goal_screen.buttons.edit'.tr(),
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 23),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      showDialog(
                                        context: context,
                                        builder: (context) => Container(
                                          width: 300,
                                          height: 300,
                                          child: AlertDialog(
                                            title: Text(
                                              "budget_goal_screen.DeletMsg"
                                                  .tr(),
                                              style: const TextStyle(
                                                fontSize: 25,
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "budget_goal_screen.No".tr(),
                                                  style: const TextStyle(
                                                      fontSize: 23,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  // ScaffoldMessenger.of(context)
                                                  //     .showSnackBar(SnackBar(
                                                  //         content: Text(
                                                  //             "the id for for deleting :$entry")));
                                                  await tableDb.deleteEntry(
                                                      entry['id'].toString());
                                                  fetchData();
                                                  setState(() {
                                                    enteredvalues.remove(
                                                        entry); // Remove the selected entry
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "budget_goal_screen.Yes".tr(),
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 23),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'budget_goal_screen.buttons.delete'.tr(),
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 23),
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
        ));
  }

  _showEditDialog(Map<String, dynamic> entry, int index) {
    final TextEditingController amountController =
        TextEditingController(text: entry['amount']);
    final TextEditingController startDateController =
        TextEditingController(text: entry['StartDate']);

    String selectedCategory = entry['category'] ?? categoryTitle.first;
    String editMonthValue = '';
    String editYearValue = '';
    String isMonthly = entry['budgetType'];

    if (isMonthly == monthly) {
      editMonthValue = entry['month']!;
      editYearValue = entry['year']!;
    } else {
      startDateController.text = entry['StartDate']!;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Edit your Budget Goal",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: ColorConstant.defIndigo,
              ),
            ),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (dropDownMonthOrWeekValue ==
                        "budget_goal_screen.dropdowns.monthly".tr()) ...[
                      if (isMonthly != monthly) ...[
                        Container(
                          height:
                              MediaQuery.of(context).size.width < 600 ? 50 : 70,
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
                                border: InputBorder.none,
                              ),
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
                      ] else ...[
                        Container(
                          height:
                              MediaQuery.of(context).size.width < 600 ? 50 : 70,
                          width: MediaQuery.of(context).size.width < 600
                              ? 250
                              : 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: DropdownButton<String>(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                            ),
                            underline: Container(),
                            value: editMonthValue.isEmpty
                                ? months.first
                                : editMonthValue, // Ensure a valid value
                            items: months.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 23),
                                  ),
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
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height:
                              MediaQuery.of(context).size.width < 600 ? 50 : 70,
                          width: MediaQuery.of(context).size.width < 600
                              ? 250
                              : 300,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: DropdownButton<String>(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                            ),
                            underline: Container(),
                            value: editYearValue.isEmpty
                                ? years.first
                                : editYearValue, // Ensure a valid value
                            items: years.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 23),
                                  ),
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
                      ],
                    ] else if (dropDownMonthOrWeekValue ==
                        "budget_goal_screen.dropdowns.weekly".tr()) ...[
                      if (isMonthly == monthly) ...[
                        Container(
                          height:
                              MediaQuery.of(context).size.width < 600 ? 50 : 70,
                          width: MediaQuery.of(context).size.width < 600
                              ? 250
                              : 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: DropdownButton<String>(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                            ),
                            underline: Container(),
                            value: editMonthValue.isEmpty
                                ? months.first
                                : editMonthValue, // Ensure a valid value
                            items: months.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    value,
                                    style: TextStyle(fontSize: 23),
                                  ),
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
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height:
                              MediaQuery.of(context).size.width < 600 ? 50 : 70,
                          width: MediaQuery.of(context).size.width < 600
                              ? 250
                              : 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: DropdownButton<String>(
                            icon: Icon(Icons.key),
                            underline: Container(),
                            value: editYearValue.isEmpty
                                ? years.first
                                : editYearValue, // Ensure a valid value
                            items: years.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 23,
                                    ),
                                  ),
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
                      ] else ...[
                        Container(
                          height:
                              MediaQuery.of(context).size.width < 600 ? 50 : 70,
                          width: MediaQuery.of(context).size.width < 600
                              ? 250
                              : 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              style: TextStyle(fontSize: 23),
                              controller: startDateController,
                              decoration: const InputDecoration(
                                hintText: "Start Date",
                                border: InputBorder.none,
                              ),
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await _selectDate(context, startDateController);
                              },
                            ),
                          ),
                        ),
                      ],
                    ],
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width < 600 ? 50 : 70,
                      width:
                          MediaQuery.of(context).size.width < 600 ? 250 : 300,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          style: TextStyle(fontSize: 23),
                          keyboardType: TextInputType.number,
                          controller: amountController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Amount",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width < 600 ? 50 : 70,
                      width:
                          MediaQuery.of(context).size.width < 600 ? 250 : 300,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: DropdownButton<String>(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 40,
                        ),
                        underline: Container(),
                        value: selectedCategory,
                        items: categoryTitle.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 23,
                                ),
                              ),
                            )),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
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
                        MediaQuery.of(context).size.width < 600 ? 18 : 25),
              ),
            ),
            TextButton(
              onPressed: () {
                Map<String, dynamic> updatedEntry = {
                  "year": editYearValue,
                  "budgetType": isMonthly == monthly ? monthly : weekly,
                  'month': editMonthValue,
                  "StartDate": dropDownMonthOrWeekValue ==
                          "budget_goal_screen.dropdowns.monthly"
                      ? ""
                      : startDateController.text,
                  "endDate": "",
                  'categoryId': categoryId,
                  'amount': amountController.text,
                  'category': selectedCategory,
                };

                print("Updated Entry: $updatedEntry");
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
                        MediaQuery.of(context).size.width < 600 ? 18 : 25),
              ),
            ),
          ],
        );
      },
    );
  }
}
