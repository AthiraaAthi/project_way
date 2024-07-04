import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_way/utils/color_constant/color_constant.dart';

class DiaryWidget extends StatelessWidget {
  const DiaryWidget({
    super.key,
    required this.title,
    required this.content,
    this.onEditTap,
    this.onViewTap,
  });
  final String title;
  final String content;
  //final String date;

  final void Function()? onEditTap;
  final void Function()? onViewTap;

  @override
  Widget build(BuildContext context) {
    double containerHeight = 40;
    double containerWidth = 80;

    if (context.locale.languageCode == 'en') {
      containerHeight = 40;
      containerWidth = 80;
    } else if (context.locale.languageCode == 'ml') {
      containerHeight = 40;
      containerWidth = 100;
    }

    return Container(
      height: MediaQuery.of(context).size.width < 600 ? 155 : 255,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: MediaQuery.of(context).size.width < 600
                      ? TextStyle(fontWeight: FontWeight.w800)
                      : TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                ),
                Text(
                  "1-05-2023",
                  style: MediaQuery.of(context).size.width < 600
                      ? TextStyle(fontWeight: FontWeight.w500, fontSize: 13)
                      : TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                ),
              ],
            ),
            Text(
              content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MediaQuery.of(context).size.width < 600
                  ? TextStyle(
                      fontWeight: FontWeight.w400,
                    )
                  : TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onEditTap,
                  child: Container(
                    height: MediaQuery.of(context).size.width < 600
                        ? containerHeight
                        : 60,
                    width: MediaQuery.of(context).size.width < 600
                        ? containerWidth
                        : 100,
                    decoration: BoxDecoration(
                        color: ColorConstant.defGreen,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "diary.edit".tr(),
                        style: MediaQuery.of(context).size.width < 600
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: context.locale.languageCode == 'en'
                                    ? 15
                                    : 12,
                                fontWeight: FontWeight.bold,
                              )
                            : TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                InkWell(
                  onTap: onViewTap,
                  child: Container(
                    height: MediaQuery.of(context).size.width < 600
                        ? containerHeight
                        : 60,
                    width: MediaQuery.of(context).size.width < 600
                        ? containerWidth
                        : 100,
                    decoration: BoxDecoration(
                        color: ColorConstant.defIndigo,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "diary.view".tr(),
                        style: MediaQuery.of(context).size.width < 600
                            ? TextStyle(
                                color: Colors.white,
                                fontSize: context.locale.languageCode == 'en'
                                    ? 15
                                    : 12,
                                fontWeight: FontWeight.bold,
                              )
                            : TextStyle(color: Colors.white, fontSize: 18),
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
