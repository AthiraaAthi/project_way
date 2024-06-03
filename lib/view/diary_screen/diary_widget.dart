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
                    height: MediaQuery.of(context).size.width < 600 ? 40 : 60,
                    width: MediaQuery.of(context).size.width < 600 ? 80 : 100,
                    decoration: BoxDecoration(
                        color: ColorConstant.defGreen,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Edit",
                        style: MediaQuery.of(context).size.width < 600
                            ? TextStyle(color: Colors.white)
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
                    height: MediaQuery.of(context).size.width < 600 ? 40 : 60,
                    width: MediaQuery.of(context).size.width < 600 ? 80 : 100,
                    decoration: BoxDecoration(
                        color: ColorConstant.defIndigo,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "View",
                        style: MediaQuery.of(context).size.width < 600
                            ? TextStyle(color: Colors.white)
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
