import 'package:flutter/material.dart';

class WeeklyBudgetEdit extends StatefulWidget {
  const WeeklyBudgetEdit({
    super.key,
    required this.startDateController,
  });
  final TextEditingController startDateController;

  @override
  State<WeeklyBudgetEdit> createState() => _WeeklyBudgetEditState();
}

class _WeeklyBudgetEditState extends State<WeeklyBudgetEdit> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: MediaQuery.of(context).size.width < 600 ? 50 : 70,
          width: MediaQuery.of(context).size.width < 600 ? 250 : 300,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: widget.startDateController,
              decoration: InputDecoration(
                  hintText: "Start Date", border: InputBorder.none),
              onChanged: (value) {},
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                await _selectDate(context, widget.startDateController);
              },
            ),
          ),
        ),
      ],
    );
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
}
