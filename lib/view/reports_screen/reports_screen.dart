import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/view/screen/responsive.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  List<String> numbers = [
    "reports.selectYear".tr(),
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026"
  ];
  String dropDownValue = "reports.selectYear".tr();
  List<String> months = [
    "reports.selectMonth".tr(),
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
  String dropDownMonthValue = "reports.selectMonth".tr();
  List<Map<String, String>> tableData = [
    {
      "date": "1-5-2024",
      "category": "reports.tableData.tableCategory1".tr(),
      "amount": "reports.tableData.tableAmount1".tr(),
    },
    {
      "date": "2-5-2024",
      "category": "reports.tableData.tableCategory2".tr(),
      "amount": "reports.tableData.tableAmount2".tr(),
    },
    {
      "date": "3-5-2024",
      "category": "reports.tableData.tableCategory3".tr(),
      "amount": "reports.tableData.tableAmount3".tr(),
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                    "reports.reportsTitle".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Text(
                    "reports.reportsTitle".tr(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
        body: ResponsiveWidget(
          mobile: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 130,
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
                    ],
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
                          "reports.submit".tr(),
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
                  Text(
                    "reports.expenseWarning".tr(),
                    style: TextStyle(color: Colors.red, fontSize: 11.7),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "reports.totalIncome".tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DataTable(
                    dataRowMaxHeight: 80,
                    columnSpacing: 60,
                    border: TableBorder.all(),
                    columns: [
                      DataColumn(
                          label: Text(
                        'reports.report_table.date'.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 13),
                      )),
                      DataColumn(
                          label: Text(
                        'reports.report_table.category'.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 13),
                      )),
                      DataColumn(
                          label: Text(
                        'reports.report_table.amount'.tr(),
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
                          ]),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "reports.totalExpense".tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DataTable(
                    dataRowMaxHeight: 80,
                    columnSpacing: 60,
                    border: TableBorder.all(),
                    columns: [
                      DataColumn(
                          label: Text(
                        'reports.report_table.date'.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 13),
                      )),
                      DataColumn(
                          label: Text(
                        'reports.report_table.category'.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 13),
                      )),
                      DataColumn(
                          label: Text(
                        'reports.report_table.amount'.tr(),
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
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 230,
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
                        alignment: Alignment.center,
                        height: 70,
                        width: 230,
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
                          items: months
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
                              dropDownMonthValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      // Handle the submit action
                    },
                    child: Container(
                      height: 65,
                      width: 300,
                      decoration: BoxDecoration(
                        color: ColorConstant.defIndigo,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "reports.submit".tr(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "reports.expenseWarning".tr(),
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: context.locale.languageCode == 'en' ? 22 : 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "reports.totalIncome".tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DataTable(
                    dataRowMaxHeight: 120,
                    columnSpacing: 160,
                    border: TableBorder.all(),
                    columns: [
                      DataColumn(
                          label: Text(
                        'reports.report_table.date'.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )),
                      DataColumn(
                          label: Text(
                        'reports.report_table.category'.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )),
                      DataColumn(
                          label: Text(
                        'reports.report_table.amount'.tr(),
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
                          ]),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "reports.totalExpense".tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DataTable(
                    dataRowMaxHeight: 120,
                    columnSpacing: 160,
                    border: TableBorder.all(),
                    columns: [
                      DataColumn(
                          label: Text(
                        'reports.report_table.date'.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )),
                      DataColumn(
                          label: Text(
                        'reports.report_table.category'.tr(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      )),
                      DataColumn(
                          label: Text(
                        'reports.report_table.amount'.tr(),
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
                          ]),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
