import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:intl/intl.dart';

class NudgeCard extends StatefulWidget {
  const NudgeCard({super.key, required this.plan});

  final String plan;

  @override
  State<NudgeCard> createState() => _NudgeCardState();
}

class _NudgeCardState extends State<NudgeCard> {
  String day = DateFormat('EEEE').format(DateTime.now());
  String date = DateFormat('mm/dd/yyyy').format(DateTime.now());
  String times = "10:00AM - 12:00PM";
  int numNudges = 10;
  String cost = 'Free';
  final List<Widget> avatars = List.generate(
    4,
    (index) => const CircleAvatar(
      backgroundColor: Color(0xffE6E6E6),
      radius: 16,
      child: Icon(
        Icons.person,
        color: Color(0xffCCCCCC),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.getWidth(context, 8),
          vertical: AppSize.getHeight(context, 8)),
      child: Container(
        decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Column(
          children: [
            SizedBox(
              height: AppSize.getHeight(context, 190),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.darkBlue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: AppSize.getWidth(context, 48),right: AppSize.getWidth(context, 48)),
                    child: Text(
                      widget.plan,
                      style: TextStyle(
                          fontSize: AppSize.getFontSize(context, 33),
                          fontWeight: FontWeight.bold,
                          color: AppColor.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSize.getHeight(context, 8)),
              // TODO: finish the second half
              child: SizedBox(
                height: AppSize.getHeight(context, 190),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.getWidth(context, 16)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: AppSize.getWidth(context, 8)),
                                  child: Icon(
                                    Icons.calendar_month_rounded,
                                    size: AppSize.getHeight(context, 20),
                                    color: AppColor.darkGray,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      day,
                                      style: TextStyle(
                                          fontSize:
                                              AppSize.getFontSize(context, 16)),
                                    ),
                                    Text(
                                      date,
                                      style: TextStyle(
                                          fontSize:
                                              AppSize.getFontSize(context, 16)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: AppSize.getWidth(context, 8)),
                                  child: Icon(
                                    Icons.access_time_filled,
                                    color: AppColor.darkGray,
                                    size: AppSize.getHeight(context, 20),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Time:",
                                      style: TextStyle(
                                          fontSize:
                                              AppSize.getFontSize(context, 16)),
                                    ),
                                    Text(
                                      times,
                                      style: TextStyle(
                                          fontSize:
                                              AppSize.getFontSize(context, 16)),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppSize.getHeight(context, 8)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: AppSize.getWidth(context, 8)),
                                child: Icon(
                                  Icons.monetization_on,
                                  color: AppColor.darkGray,
                                  size: AppSize.getHeight(context, 20),
                                ),
                              ),
                              Text(
                                'Cost: $cost',
                                style: TextStyle(
                                    fontSize: AppSize.getFontSize(context, 16)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppSize.getHeight(context, 16)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: AppSize.getWidth(context, 8)),
                                child: Icon(
                                  Icons.groups,
                                  color: AppColor.black,
                                  size: AppSize.getHeight(context, 24),
                                ),
                              ),
                              Text(
                                '$numNudges nudged',
                                style: TextStyle(
                                    fontSize: AppSize.getFontSize(context, 18),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: AppSize.getWidth(context, 12),
                              ),
                              Row(
                                children: avatars,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
