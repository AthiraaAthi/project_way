import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';
import 'package:project_way/utils/image_constant/image_constant.dart';
import 'package:project_way/view/diary_screen/diary_edit_dialog.dart';
import 'package:project_way/view/diary_screen/diary_widget.dart';
import 'package:project_way/view/diary_screen/view_diary.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({super.key});

  @override
  State<MyDiaryScreen> createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen> {
  final titleController = TextEditingController();
  final desController = TextEditingController();
  List<Map<String, String>> mylist = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.bgBlue,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width < 600 ? 60 : 80,
          backgroundColor: ColorConstant.defIndigo,
          title: Text(
            "diary.myDiaryAppbar".tr(),
            style: MediaQuery.of(context).size.width < 600
                ? TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: context.locale.languageCode == 'en' ? 20 : 17,
                    fontWeight: FontWeight.w500)
                : TextStyle(
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
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MediaQuery.of(context).size.width < 600
                            ? Container(
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
                                          "diary.todaysDiary".tr(),
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
                                              border: Border.all(
                                                  color: Colors.grey),
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
                                              hintText: "diary.titleHint".tr(),
                                              hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Container(
                                                height: 200,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: TextField(
                                                  controller: desController,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16.0,
                                                              vertical: 12.0),
                                                      border: InputBorder.none,
                                                      hintText:
                                                          "diary.enterTextHint"
                                                              .tr(),
                                                      hintStyle: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey)),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundColor:
                                                        ColorConstant.defIndigo,
                                                    child: Icon(
                                                      Icons.mic_none_outlined,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "diary.lockDiary".tr(),
                                          style: TextStyle(fontSize: 12.5),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                ImageConstant.fingerPrint,
                                              ),
                                            ),
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
                                                'description':
                                                    desController.text,
                                              });
                                            });
                                            titleController.clear();
                                            desController.clear();

                                            Navigator.pop(context);

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
                                                "diary.submit".tr(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
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
                            //FOR TAB DIALOG
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
                                      children: [
                                        Text(
                                          "diary.todaysDiary".tr(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          height: 70,
                                          width: 450,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextField(
                                            style: TextStyle(fontSize: 20),
                                            controller: titleController,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 12.0),
                                              border: InputBorder.none,
                                              hintText: "diary.titleHint".tr(),
                                              hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Container(
                                                height: 250,
                                                width: 450,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: TextField(
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                  controller: desController,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16.0,
                                                              vertical: 12.0),
                                                      border: InputBorder.none,
                                                      hintText:
                                                          "diary.enterTextHint"
                                                              .tr(),
                                                      hintStyle: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.grey)),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor:
                                                        ColorConstant.defIndigo,
                                                    child: Icon(
                                                      Icons.mic_none_outlined,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          "diary.lockDiary".tr(),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  ImageConstant.fingerPrint),
                                            ),
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
                                                'description':
                                                    desController.text,
                                              });
                                            });

                                            Navigator.pop(context);
                                            titleController.clear();
                                            desController.clear();

                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 55,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                color: ColorConstant.defIndigo,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
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
                    },
                  );
                },
                child: Padding(
                  padding: MediaQuery.of(context).size.width < 600
                      ? EdgeInsets.all(8.0)
                      : EdgeInsets.all(16),
                  child: Text(
                    "diary.addNew".tr(),
                    style: MediaQuery.of(context).size.width < 600
                        ? TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                        : TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 19,
                          ),
                  ),
                ),
              ),
            )
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
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: DiaryWidget(
                title: mylist[index]['title']!,
                content: mylist[index]['description']!,
                onViewTap: () {
                  //////View///
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewDiaryScreen(
                        AppBarText: mylist[index]['title']!,
                        title: mylist[index]['title']!,
                        content: mylist[index]['description']!,
                      ),
                    ),
                  );
                },
                onEditTap: () {
                  /////////EDITING//////////
                  showDialog(
                    context: context,
                    builder: (context) {
                      titleController.text = mylist[index]['title']!;
                      desController.text = mylist[index]['description']!;

                      return EditdiaryDialog(
                          titleController: titleController,
                          desController: desController,
                          mylist: mylist,
                          index: index,
                          setStateCallback: () {
                            setState(() {
                              mylist[index]['title'] = titleController.text;
                              mylist[index]['description'] = desController.text;

                              titleController.clear();
                              desController.clear();
                            });
                          });
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
