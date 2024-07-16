import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/size.dart';

class NudgeSuggestion extends StatefulWidget {
  const NudgeSuggestion(
      {super.key,
        required this.text1,
        required this.imagePath,
        required this.text2, required this.flip, required this.color});

  final String text1;
  final String text2;
  final String imagePath;
  final bool flip;
  final Color color;

  @override
  State<NudgeSuggestion> createState() => _NudgeSuggestionState();
}

class _NudgeSuggestionState extends State<NudgeSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.lightGray,
          borderRadius: BorderRadius.all((Radius.circular(16)))),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppSize.getHeight(context, 16),
            horizontal: AppSize.getWidth(context, 16)),
        child: Column(
          children: [
            Transform.flip(
              flipX: widget.flip,
              child: Image(
                image: AssetImage(widget.imagePath),
                color: widget.color,
                height: AppSize.getHeight(context, 20),

              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top:AppSize.getHeight(context, 8)),
              child: Column(
                children: [
                  Text(
                    widget.text1,
                    style: TextStyle(
                        fontSize: AppSize.getFontSize(context, 15),
                        fontWeight: FontWeight.w500,
                        color: AppColor.black),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:AppSize.getHeight(context, 12)),
                    child: Text(
                      widget.text2,
                      style: TextStyle(
                          fontSize: AppSize.getFontSize(context, 13),
                          color: AppColor.darkGray),
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
