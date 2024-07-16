import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/size.dart';

class ActionCard extends StatefulWidget {
  const ActionCard(
      {super.key,
      required this.text1,
      required this.imagePath,
      required this.text2});

  final String text1;
  final String text2;
  final String imagePath;

  @override
  State<ActionCard> createState() => _ActionCardState();
}

class _ActionCardState extends State<ActionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.lightGray,
          borderRadius: BorderRadius.all((Radius.circular(16)))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppSize.getHeight(context, 8),
            horizontal: AppSize.getWidth(context, 24)),
        child: Column(
          children: [
             Image(
              image: AssetImage(widget.imagePath),
            ),
            Padding(
              padding:  EdgeInsets.only(top:AppSize.getHeight(context, 4)),
              child: Column(
                children: [
                  Text(
                    widget.text1,
                    style: TextStyle(
                        fontSize: AppSize.getFontSize(context, 13),
                        fontWeight: FontWeight.w500,
                        color: AppColor.black),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:AppSize.getHeight(context, 2)),
                    child: Text(
                      widget.text2,
                      style: TextStyle(
                          fontSize: AppSize.getFontSize(context, 13),
                          fontWeight: FontWeight.w700,
                          color: AppColor.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
