import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/screen/responsive.dart';

class BudgetGoalScreen extends StatefulWidget {
  const BudgetGoalScreen({super.key});

  @override
  State<BudgetGoalScreen> createState() => _BudgetGoalScreenState();
}

class _BudgetGoalScreenState extends State<BudgetGoalScreen> {
  List<String> numbers = [
    // for year
    "budget_goal_screen.dropdowns.year_selection".tr(),
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026"
  ];

  String dropDownValue = "budget_goal_screen.dropdowns.year_selection".tr();
  List<String> months = [
    // for month
    "budget_goal_screen.dropdowns.month_selection".tr(),
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec" // "budget_goal_screen.budget_months.Jan".tr(),
    // "budget_goal_screen.budget_months.Feb".tr(),
    // "budget_goal_screen.budget_months.Mar".tr(),
    // "budget_goal_screen.budget_months.Apr".tr(),
    // "budget_goal_screen.budget_months.May".tr(),
    // "budget_goal_screen.budget_months.Jun".tr(),
    // "budget_goal_screen.budget_months.Jul".tr(),
    // "budget_goal_screen.budget_months.Aug".tr(),
    // "budget_goal_screen.budget_months.Sep".tr(),
    // "budget_goal_screen.budget_months.Oct".tr(),
    // "budget_goal_screen.budget_months.Nov".tr(),
    // "budget_goal_screen.budget_months.Dec".tr(),
  ];
  String dropDownMonthValue =
      "budget_goal_screen.dropdowns.month_selection".tr();
  List<String> MonthOrWeek = [
    "budget_goal_screen.dropdowns.monthly".tr(),
    "budget_goal_screen.dropdowns.weekly".tr()
  ]; // week or month selection
  String dropDownMonthOrWeekValue = "budget_goal_screen.dropdowns.monthly".tr();
  List<String> Category = [
    "budget_goal_screen.dropdowns.budgetCategory".tr(),
    "budget_goal_screen.categoryValues.Food".tr(),
    "budget_goal_screen.categoryValues.Notebooks".tr(),
    "budget_goal_screen.categoryValues.Income".tr(),
  ]; // category selection
  String CategoryDropDownValue =
      "budget_goal_screen.dropdowns.budgetCategory".tr();
  List<Map<String, String>> tableData = [
    // For Table
    {
      "date": "1-5-2024",
      "category": "budget_goal_screen.categoryValues.Estate".tr(),
      "amount": "5000 Rs"
    },
    {
      "date": "2-5-2024",
      "category": "budget_goal_screen.categoryValues.Food".tr(),
      "amount": "5000 Rs"
    },
    {
      "date": "3-5-2024",
      "category": "budget_goal_screen.categoryValues.Food".tr(),
      "amount": "5000 Rs"
    },
    {
      "date": "1-5-2024",
      "category": "budget_goal_screen.categoryValues.Estate".tr(),
      "amount": "5000 Rs"
    },
    {
      "date": "2-5-2024",
      "category": "budget_goal_screen.categoryValues.Food".tr(),
      "amount": "5000 Rs"
    },
    {
      "date": "3-5-2024",
      "category": "budget_goal_screen.categoryValues.Food".tr(),
      "amount": "5000 Rs"
    },
  ];
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
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

  @override
  Widget build(BuildContext context) {
    double hintSize = 12;
    if (context.locale.languageCode == 'en') {
      hintSize = 15;
    } else if (context.locale.languageCode == 'ml') {
      hintSize = 13;
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
                      ? Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        )),
              title: MediaQuery.of(context).size.width < 600
                  ? Text(
                      "budget_goal_screen.budget_goal_title".tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
                      "budget_goal_screen.budget_goal_title".tr(),
                      style: TextStyle(
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
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
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
                                    style: TextStyle(
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
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
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
                                    style: TextStyle(
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
                    SizedBox(
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
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
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
                                      style: TextStyle(
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
                            child: DropdownButton<String>(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              underline: Container(),
                              value: CategoryDropDownValue,
                              items: Category.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  CategoryDropDownValue = value!;
                                });
                              },
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
                                  hintStyle: TextStyle(fontSize: hintSize),
                                  hintText:
                                      "budget_goal_screen.hints.startDate".tr(),
                                  contentPadding: EdgeInsets.symmetric(
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
                                  contentPadding: EdgeInsets.symmetric(
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 323,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButton<String>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          underline: Container(),
                          value: CategoryDropDownValue,
                          items: Category.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              CategoryDropDownValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 323,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "budget_goal_screen.hints.enterAmount".tr(),
                            hintStyle: TextStyle(fontSize: 13),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // Handle the submit action
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
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DataTable(
                      dataRowMaxHeight: 60,
                      columnSpacing: 30,
                      border: TableBorder.all(color: Colors.grey, width: 0.5),
                      columns: [
                        DataColumn(
                            label: Text(
                          'budget_goal_screen.tableHeaders.date'.tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 13),
                        )),
                        DataColumn(
                            label: Text(
                          'budget_goal_screen.tableHeaders.category'.tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 13),
                        )),
                        DataColumn(
                            label: Text(
                          'budget_goal_screen.tableHeaders.amount'.tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 13),
                        )),
                        DataColumn(
                            label: Text(
                          'budget_goal_screen.tableHeaders.action'.tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 13),
                        )),
                      ],
                      rows: tableData
                          .map(
                            (data) => DataRow(cells: [
                              DataCell(Text(
                                data['date']!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              )),
                              DataCell(Text(
                                data['category']!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              )),
                              DataCell(Text(
                                data['amount']!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              )),
                              DataCell(Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'budget_goal_screen.buttons.edit'.tr(),
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 13),
                                    ),
                                  ),
                                  Text(
                                    'budget_goal_screen.buttons.delete'.tr(),
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 13),
                                  )
                                ],
                              )),
                            ]),
                          )
                          .toList(),
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
                            icon: Icon(
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
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
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
                            icon: Icon(
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
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
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
                    SizedBox(
                      height: 30,
                    ),
                    if (dropDownMonthOrWeekValue == "Monthly") ...[
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
                              icon: Icon(
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
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
                            child: DropdownButton<String>(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                                size: 30,
                              ),
                              underline: Container(),
                              value: CategoryDropDownValue,
                              items: Category.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  CategoryDropDownValue = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ] else if (dropDownMonthOrWeekValue == "Weekly") ...[
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
                                hintText: "Start Date",
                                hintStyle: TextStyle(fontSize: 18),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 80),
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
                                hintText: "End Date",
                                hintStyle: TextStyle(fontSize: 18),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 80),
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
                      SizedBox(
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
                        child: DropdownButton<String>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 30,
                          ),
                          underline: Container(),
                          value: CategoryDropDownValue,
                          items: Category.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              CategoryDropDownValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                    SizedBox(
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Amount",
                          hintStyle: TextStyle(fontSize: 18),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 150),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        // Handle the submit action
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
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    DataTable(
                      headingRowHeight: 70,
                      dataRowMaxHeight: 100,
                      columnSpacing: 120,
                      border: TableBorder.all(color: Colors.grey, width: 1),
                      columns: const [
                        DataColumn(
                            label: Text(
                          'Date',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        )),
                        DataColumn(
                            label: Text(
                          'Category',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        )),
                        DataColumn(
                            label: Text(
                          'Amount',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        )),
                        DataColumn(
                            label: Text(
                          'Action',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        )),
                      ],
                      rows: tableData
                          .map(
                            (data) => DataRow(cells: [
                              DataCell(Text(
                                data['date']!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              )),
                              DataCell(Text(
                                data['category']!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              )),
                              DataCell(Text(
                                data['amount']!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              )),
                              DataCell(Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 18),
                                    ),
                                  ),
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  )
                                ],
                              )),
                            ]),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
