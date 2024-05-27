import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class BudgetGoalScreen extends StatefulWidget {
  const BudgetGoalScreen({super.key});

  @override
  State<BudgetGoalScreen> createState() => _BudgetGoalScreenState();
}

class _BudgetGoalScreenState extends State<BudgetGoalScreen> {
  List<String> numbers = [
    // for year
    "select year",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026"
  ];
  String dropDownValue = "select year";
  List<String> months = [
    // for month
    "select month",
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
    "Dec"
  ];
  String dropDownMonthValue = "select month";
  List<String> MonthOrWeek = ["Monthly", "Weekly"]; // week or month selection
  String dropDownMonthOrWeekValue = "Monthly";
  List<String> Category = [
    "Category",
    "Food",
    "Books",
    "Income"
  ]; // category selection
  String CategoryDropDownValue = "Category";
  List<Map<String, String>> tableData = [
    // For Table
    {"date": "1-5-2024", "category": "Estate", "amount": "5000 Rs"},
    {"date": "2-5-2024", "category": "Food", "amount": "5000 Rs"},
    {"date": "3-5-2024", "category": "Food", "amount": "5000 Rs"},
    {"date": "1-5-2024", "category": "Estate", "amount": "5000 Rs"},
    {"date": "2-5-2024", "category": "Food", "amount": "5000 Rs"},
    {"date": "3-5-2024", "category": "Food", "amount": "5000 Rs"},
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
      BuildContext context, TextEditingController controller) async {
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
    return Scaffold(
      backgroundColor: ColorConstant.bgBlue,
      appBar: AppBar(
        backgroundColor: ColorConstant.defIndigo,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Budget Goal",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                      items:
                          numbers.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
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
                                  fontWeight: FontWeight.bold, fontSize: 15),
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
              if (dropDownMonthOrWeekValue == "Monthly") ...[
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
                        items: months
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                value,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
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
                                    fontWeight: FontWeight.bold, fontSize: 15),
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
                            hintText: "Start Date",
                            contentPadding: EdgeInsets.symmetric(
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
                            hintText: "End Date",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
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
                    items:
                        Category.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            value,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
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
                      hintText: "Enter Amount",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
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
                height: 20,
              ),
              DataTable(
                dataRowMaxHeight: 60,
                columnSpacing: 30,
                border: TableBorder.all(color: Colors.grey, width: 0.5),
                columns: const [
                  DataColumn(
                      label: Text(
                    'Date',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 13),
                  )),
                  DataColumn(
                      label: Text(
                    'Category',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 13),
                  )),
                  DataColumn(
                      label: Text(
                    'Amount',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 13),
                  )),
                  DataColumn(
                      label: Text(
                    'Action',
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
                                "Edit",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 13),
                              ),
                            ),
                            Text(
                              "Delete",
                              style: TextStyle(color: Colors.red, fontSize: 13),
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
    );
  }
}
