import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/screen/responsive.dart';
import 'package:project_way/view/track_budget_screen/budget_graph.dart';
import 'package:project_way/view/track_budget_screen/track_budget_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class TrackBudgetScreen extends StatefulWidget {
  TrackBudgetScreen({super.key});

  @override
  State<TrackBudgetScreen> createState() => _TrackBudgetScreenState();
}

class _TrackBudgetScreenState extends State<TrackBudgetScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.bgBlue,
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
            backgroundColor: ColorConstant.defIndigo,
            title: MediaQuery.of(context).size.width < 600
                ? Text(
                    "Track Budget",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                : Text(
                    "Track Budget",
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BudgetGraphScreen(),
                          ));
                    },
                    child: MediaQuery.of(context).size.width < 600
                        ? Container(
                            height: 25,
                            width: 25,
                            child: Image.asset(ImageConstant.graph))
                        : Container(
                            height: 40,
                            width: 40,
                            child: Image.asset(ImageConstant.graph))),
              )
            ],
          ),
          body: ResponsiveWidget(
            mobile: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TableCalendar(
                      daysOfWeekHeight: 50,
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekendStyle: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                          weekdayStyle: TextStyle(
                              color: ColorConstant.defIndigo,
                              fontWeight:
                                  FontWeight.bold), //week day colorchange
                          decoration: BoxDecoration(
                            color: ColorConstant
                                .bgIndigo, //bgcolor of week names,still trying to change the clr of week nmes
                          )),
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay =
                              focusedDay; // updates the _focusedDay  as well
                        });
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: TextStyle(
                            color: ColorConstant.defIndigo,
                            fontWeight: FontWeight.bold), //wasted
                        weekendTextStyle: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold), //the weekend color
                        weekNumberTextStyle: TextStyle(
                          color: Colors.amberAccent,
                        ), //wasted
                        tableBorder: TableBorder(
                            bottom: BorderSide(color: Colors.grey),
                            horizontalInside:
                                BorderSide(color: Colors.grey, width: 2)),

                        todayDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ColorConstant.defIndigo,
                              ColorConstant.defGreen,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.5, 0.5],
                          ),
                          //color: ColorConstant.defIndigo,
                          shape: BoxShape.rectangle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: ColorConstant.defGreen,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          color: ColorConstant.defGreen,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Income",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          height: 15,
                          width: 15,
                          color: ColorConstant.defIndigo,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Expense",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TrackBudgetWidget(
                      title: "Income",
                      date: "21-4-2024",
                      subtitle: "Estate (Category)",
                      amount: "+ 35000",
                      color: ColorConstant.defGreen,
                      amountColor: ColorConstant.defGreen,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TrackBudgetWidget(
                      title: "Expense",
                      date: "21-4-2024",
                      subtitle: "Food (Category)",
                      amount: "- 3500",
                      color: ColorConstant.defIndigo,
                      amountColor: Colors.red,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TrackBudgetWidget(
                      title: "Income",
                      date: "21-4-2024",
                      subtitle: "Estate (Category)",
                      amount: "+ 35000",
                      color: ColorConstant.defGreen,
                      amountColor: ColorConstant.defGreen,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TrackBudgetWidget(
                      title: "Expense",
                      date: "21-4-2024",
                      subtitle: "Food (Category)",
                      amount: "- 3500",
                      color: ColorConstant.defIndigo,
                      amountColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
            //FOR TAB
            tab: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TableCalendar(
                      rowHeight: 80,
                      daysOfWeekHeight: 90,
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekendStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          weekdayStyle: TextStyle(
                              color: ColorConstant.defIndigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 20), //week day colorchange
                          decoration: BoxDecoration(
                            color: ColorConstant
                                .bgIndigo, //bgcolor of week names,still trying to change the clr of week nmes
                          )),
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay =
                              focusedDay; // updates the _focusedDay  as well
                        });
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: TextStyle(
                            color: ColorConstant.defIndigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        weekendTextStyle: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20), //the weekend color
                        weekNumberTextStyle: TextStyle(
                          color: Colors.amberAccent,
                        ), //wasted
                        tableBorder: TableBorder(
                            bottom: BorderSide(color: Colors.grey, width: 2),
                            horizontalInside:
                                BorderSide(color: Colors.grey, width: 2)),

                        todayDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              ColorConstant.defIndigo,
                              ColorConstant.defGreen,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.5, 0.5],
                          ),
                          //color: ColorConstant.defIndigo,
                          shape: BoxShape.rectangle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: ColorConstant.defGreen,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 22),
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            color: ColorConstant.defGreen,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Income",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            color: ColorConstant.defIndigo,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Expense",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TrackBudgetWidget(
                      title: "Income",
                      date: "21-4-2024",
                      subtitle: "Estate (Category)",
                      amount: "+ 35000",
                      color: ColorConstant.defGreen,
                      amountColor: ColorConstant.defGreen,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TrackBudgetWidget(
                      title: "Expense",
                      date: "21-4-2024",
                      subtitle: "Food (Category)",
                      amount: "- 3500",
                      color: ColorConstant.defIndigo,
                      amountColor: Colors.red,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TrackBudgetWidget(
                      title: "Income",
                      date: "21-4-2024",
                      subtitle: "Estate (Category)",
                      amount: "+ 35000",
                      color: ColorConstant.defGreen,
                      amountColor: ColorConstant.defGreen,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TrackBudgetWidget(
                      title: "Expense",
                      date: "21-4-2024",
                      subtitle: "Food (Category)",
                      amount: "- 3500",
                      color: ColorConstant.defIndigo,
                      amountColor: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
