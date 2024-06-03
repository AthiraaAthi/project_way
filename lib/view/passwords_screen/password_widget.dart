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
              "My Web password",
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
                  width: 100,
                ),
                InkWell(
                  onTap: onDeleteTap,
                  child: Container(
                    height: MediaQuery.of(context).size.width < 600 ? 40 : 60,
                    width: MediaQuery.of(context).size.width < 600 ? 80 : 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Delete",
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
