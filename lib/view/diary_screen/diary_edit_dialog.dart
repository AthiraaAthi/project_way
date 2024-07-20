import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class EditdiaryDialog extends StatelessWidget {
  const EditdiaryDialog(
      {super.key,
      required this.titleController,
      required this.desController,
      required this.mylist,
      required this.index,
      required this.setStateCallback});
  final TextEditingController titleController;
  final TextEditingController desController;
  final List<Map<String, dynamic>> mylist;
  final int index;
  final Function setStateCallback;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: MediaQuery.of(context).size.width < 600
          ? Container(
              height: 580,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "diary.editPassword".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(
                        height: 25,
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
                            hintText: "diary.editTitleHint".tr(),
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: desController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            border: InputBorder.none,
                            hintText: "diary.editTextHint".tr(),
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "diary.thumbChangeInstruction".tr(),
                        style: TextStyle(
                            color: ColorConstant.defGreen,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "diary.thumbChange".tr(),
                        style: TextStyle(
                            color: ColorConstant.defIndigo,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      InkWell(
                        onTap: () {
                          // setState(() {
                          //   mylist[index]['title'] = titleController.text;
                          //   mylist[index]['description'] = desController.text;

                          //   titleController.clear();
                          //   desController.clear();

                          //   Navigator.pop(context);
                          // });
                          setStateCallback();
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                              color: ColorConstant.defIndigo,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "diary.submit".tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
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
          //FOR TAB
          Container(
              height: 780,
              width: 540,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "diary.editPassword".tr(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 30),
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
                                horizontal: 16.0, vertical: 12.0),
                            border: InputBorder.none,
                            hintText: "diary.editTitleHint".tr(),
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 300,
                        width: 450,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          controller: desController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            border: InputBorder.none,
                            hintText: "diary.editTextHint".tr(),
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "diary.thumbChangeInstruction".tr(),
                        style: TextStyle(
                            color: ColorConstant.defGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "diary.thumbChange".tr(),
                        style: TextStyle(
                            color: ColorConstant.defIndigo,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      InkWell(
                        onTap: () {
                          // setState(() {
                          //   mylist[index]['title'] = titleController.text;
                          //   mylist[index]['description'] = desController.text;

                          //   titleController.clear();
                          //   desController.clear();

                          //   Navigator.pop(context);
                          // });
                          setStateCallback();
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 70,
                          width: 200,
                          decoration: BoxDecoration(
                              color: ColorConstant.defIndigo,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              "diary.submit".tr(),
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
