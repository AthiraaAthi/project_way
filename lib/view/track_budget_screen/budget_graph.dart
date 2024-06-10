import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class BudgetGraphScreen extends StatefulWidget {
  @override
  _BudgetGraphScreenState createState() => _BudgetGraphScreenState();
}

class _BudgetGraphScreenState extends State<BudgetGraphScreen> {
  int _toggleIndex = 0;
  final List<String> _years = ['2024', '2023', '2022'];
  final List<String> _months = [
    'Month',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  String _selectedYear = '2024';
  String _selectedMonth = 'Month';

  List<FlSpot> incomeData = [
    FlSpot(250, 1),
    FlSpot(500, 7),
    FlSpot(1000, 3),
    FlSpot(1500, 5),
    FlSpot(2000, 9),
    FlSpot(2500, 1),
  ];

  List<FlSpot> expenseData = [
    FlSpot(250, 1),
    FlSpot(500, 7),
    FlSpot(1000, 6),
    FlSpot(1500, 5),
    FlSpot(2000, 9),
    FlSpot(2500, 1),
  ];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 250:
        text = const Text('250', style: style);
        break;
      case 500:
        text = const Text('500', style: style);
        break;
      case 1000:
        text = const Text('1000', style: style);
        break;
      case 1500:
        text = const Text('1500', style: style);
        break;
      case 2000:
        text = const Text('2000', style: style);
        break;
      case 2500:
        text = const Text('2500', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 2:
        text = const Text('Feb', style: style);
        break;
      case 3:
        text = const Text('Mar', style: style);
        break;
      case 4:
        text = const Text('Apr', style: style);
        break;
      case 5:
        text = const Text('May', style: style);
        break;
      case 6:
        text = const Text('Jun', style: style);
        break;
      case 7:
        text = const Text('Jul', style: style);
        break;
      case 8:
        text = const Text('Aug', style: style);
        break;
      case 9:
        text = const Text('Sep', style: style);
        break;
      case 10:
        text = const Text('Oct', style: style);
        break;
      case 11:
        text = const Text('Nov', style: style);
        break;
      case 12:
        text = const Text('Dec', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
        title: MediaQuery.of(context).size.width < 600
            ? Text(
                "Budget Graph",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
            : Text(
                "Budget Graph",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 80,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: _selectedYear,
                    items: _years.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedYear = newValue!;
                      });
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 80,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: DropdownButton<String>(
                    underline: Container(),
                    value: _selectedMonth,
                    items: _months.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedMonth = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            FlutterToggleTab(
              width: 90,
              borderRadius: 30,
              selectedIndex: _toggleIndex,
              selectedBackgroundColors: [ColorConstant.defIndigo],
              selectedTextStyle: TextStyle(color: Colors.white),
              unSelectedTextStyle: TextStyle(color: Colors.black),
              labels: ["Income", "Expense"],
              selectedLabelIndex: (index) {
                setState(() {
                  _toggleIndex = index;
                });
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitleWidgets,
                        reservedSize: 40,
                      ),
                    ),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  minX: 0,
                  maxX: 2500,
                  minY: 0,
                  maxY: 13,
                  lineBarsData: [
                    LineChartBarData(
                      spots: _toggleIndex == 0 ? incomeData : expenseData,
                      isCurved: false,
                      barWidth: 4,
                      color: Colors.green,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Total Income : 15000 Rs"),
            Text("Total Expense : 1500 Rs"),
            Text(
              "Your Income is greater than expenses in this month. Great, Keep it up",
              style: TextStyle(color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
