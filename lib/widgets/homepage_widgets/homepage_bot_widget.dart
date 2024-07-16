import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/homepage/homepage_bloc.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/widgets/action_card_widget.dart';

class HomePageBot extends StatefulWidget {
  const HomePageBot({super.key,});
  @override
  State<HomePageBot> createState() => _HomePageBotState();
}

class _HomePageBotState extends State<HomePageBot> {
  @override
  Widget build(BuildContext context) {
    return        Center(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: AppSize.getHeight(context, 8)),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: AppSize.getWidth(context, 24),
              top: AppSize.getHeight(context, 16),
              bottom: AppSize.getHeight(context, 16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nudge Genie",
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: AppSize.getFontSize(context, 24),
                  fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  "What can I nudge you with today?",
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: AppSize.getFontSize(context, 16),
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical:AppSize.getHeight(context, 8)),
                  child: Row(
                    children: [
                      ActionCard(text1: 'Group', imagePath: 'assets/friends.png', text2: 'Quest'),
                      SizedBox(width: AppSize.getWidth(context, 8),),
                      ActionCard(text1: 'Suprise', imagePath: 'assets/star.png', text2: 'Me!'),
                      SizedBox(width: AppSize.getWidth(context, 8),),
                      ActionCard(text1: 'Find', imagePath: 'assets/nearby.png', text2: 'Nearby')
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Suggestions | ",
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: AppSize.getFontSize(context, 14),
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: ((){
                       // TODO: Some function here
                      }
                      ),
                      child: Text(
                        "View All",
                        style: TextStyle(
                            color: AppColor.lightBlue,
                            fontSize: AppSize.getFontSize(context, 14),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
