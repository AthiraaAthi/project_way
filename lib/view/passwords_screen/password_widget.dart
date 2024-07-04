import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget(
      {super.key,
      required this.link,
      required this.content,
      required this.pass,
      this.onEditTap,
      this.onDeleteTap});

  final String link;
  final String content;
  final String pass;
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    double containerHeight = 40;
    double containerWidth = 80;
    double TabcontainerHeight = 60;
    double TabcontainerWidth = 100;

    if (context.locale.languageCode == 'en') {
      containerHeight = 40;
      containerWidth = 80;
      TabcontainerHeight = 60;
      TabcontainerWidth = 100;
    } else if (context.locale.languageCode == 'ml') {
      containerHeight = 40;
      containerWidth = 90;
      TabcontainerHeight = 60;
      TabcontainerWidth = 120;
    }
    return Container(
      height: MediaQuery.of(context).size.width < 600 ? 200 : 300,
      width: MediaQuery.of(context).size.width < 600 ? 350 : 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 0.5,
                offset: Offset(0, 2),
                spreadRadius: 0.1)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "passwordScreen.MyWebPass".tr(),
              style: MediaQuery.of(context).size.width < 600
                  ? TextStyle(fontWeight: FontWeight.w800)
                  : TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
            ),
            Text(
              link,
              style: MediaQuery.of(context).size.width < 600
                  ? TextStyle(fontWeight: FontWeight.w400, color: Colors.blue)
                  : TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                      fontSize: 24,
                    ),
            ),
            Text(
              content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MediaQuery.of(context).size.width < 600
                  ? TextStyle(
                      fontWeight: FontWeight.w400,
                    )
                  : TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
            ),
            Row(
              children: [
                Text(
                  pass,
                  style: MediaQuery.of(context).size.width < 600
                      ? TextStyle(
                          fontWeight: FontWeight.w400,
                        )
                      : TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                ),
                SizedBox(
                  width: 20,
                ),
                MediaQuery.of(context).size.width < 600
                    ? Icon(
                        Icons.remove_red_eye_outlined,
                        size: 20,
                        color: Colors.blue,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        size: 30,
                        color: Colors.blue,
                      )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onEditTap,
                  child: Container(
                    height: MediaQuery.of(context).size.width < 600
                        ? containerHeight
                        : TabcontainerHeight,
                    width: MediaQuery.of(context).size.width < 600
                        ? containerWidth
                        : TabcontainerWidth,
                    decoration: BoxDecoration(
                        color: ColorConstant.defGreen,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "passwordScreen.editButton".tr(),
                        style: MediaQuery.of(context).size.width < 600
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: context.locale.languageCode == 'en'
                                    ? 15
                                    : 12,
                                fontWeight: FontWeight.bold,
                              )
                            : TextStyle(
                                color: Colors.white,
                                fontSize: context.locale.languageCode == 'en'
                                    ? 18
                                    : 17,
                                fontWeight: FontWeight.bold,
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                InkWell(
                  onTap: onDeleteTap,
                  child: Container(
                    height: MediaQuery.of(context).size.width < 600
                        ? containerHeight
                        : TabcontainerHeight,
                    width: MediaQuery.of(context).size.width < 600
                        ? containerWidth
                        : TabcontainerWidth,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "passwordScreen.deleteButton".tr(),
                        style: MediaQuery.of(context).size.width < 600
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: context.locale.languageCode == 'en'
                                    ? 15
                                    : 12,
                                fontWeight: FontWeight.bold,
                              )
                            : TextStyle(
                                color: Colors.white,
                                fontSize: context.locale.languageCode == 'en'
                                    ? 18
                                    : 17,
                                fontWeight: FontWeight.bold,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
