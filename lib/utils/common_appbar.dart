import 'package:api_testing/utils/color.dart';
import 'package:flutter/material.dart';

AppBar commonAppBar({
  required String title,
  Color? backgroundColor,
  void Function()? onTap,
  bool? isLeading,
  double? fontSize,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? MyColors.white,
    title: Text(
      title,
      //style: ,
      textAlign: TextAlign.center,
      maxLines: 2,
    ),
    leadingWidth: 80,
    centerTitle: true,
    actions: actions,
    leading: (isLeading ?? true)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                color: MyColors.custom('F4F6F9'),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios,
                color: MyColors.grey,
                size: 18,
              ),
            ),
          )
        : null,
  );
}
