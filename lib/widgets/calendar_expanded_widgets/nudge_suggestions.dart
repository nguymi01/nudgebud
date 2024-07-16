import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/widgets/nudge_suggestion.dart';

class NudgeSugesstions extends StatefulWidget {
  const NudgeSugesstions({super.key});

  @override
  State<NudgeSugesstions> createState() => _NudgeSugesstionsState();
}

class _NudgeSugesstionsState extends State<NudgeSugesstions> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
          left: AppSize.getWidth(context, 16),
          right: AppSize.getWidth(context, 16),
          bottom: AppSize.getHeight(context, 16)
      ),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top:AppSize.getHeight(context, 16)),
            child: Text(
              'You do not have any Nudges for that day!',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: AppSize.getFontSize(context, 13),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppSize.getHeight(context, 16),
                bottom: AppSize.getHeight(context, 8)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NudgeSuggestion(
                  text1: 'Send a Nudge',
                  imagePath: 'assets/nudge.png',
                  text2: 'Nudge your friends \n today or plan ahead',
                  flip: false,
                  color: AppColor.darkBlue,
                ),
                NudgeSuggestion(
                  text1: 'Get Nudged',
                  imagePath: 'assets/nudge.png',
                  text2: "Let your friends know \n you're available",
                  flip: true,
                  color: AppColor.green,
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NudgeSuggestion(
                text1: 'Submit Idea',
                imagePath: 'assets/idea.png',
                text2: 'Nudge your friends \n today or plan ahead',
                flip: false,
                color: AppColor.yellow,
              ),
              NudgeSuggestion(
                text1: 'Surprise Me!',
                imagePath: 'assets/star.png',
                text2: "Let your friends know \n you're available",
                flip: true,
                color: AppColor.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
