import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/calendar_expanded_page/calendar_expanded_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/widgets/calendar.dart';
import 'package:flutterdemo/widgets/calendar_expanded_widgets/nudge_suggestions.dart';

class CalendarExpandedPage extends StatefulWidget {
  const CalendarExpandedPage(
      {super.key, required this.today, required this.numEvents});

  final String today;
  final int numEvents;

  @override
  State<CalendarExpandedPage> createState() => _CalendarExpandedPageState();
}

class _CalendarExpandedPageState extends State<CalendarExpandedPage> {
  CalendarExpandedBloc bloc = CalendarExpandedBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is CalendarExpandedInitial) {
          return mainView(context, DateTime.now());
        } else if (state is CalendarExpandedStateShowDate) {
          return mainView(context, state.date);
        }
        return Container();
      },
    );
  }

  Widget mainView(BuildContext context, DateTime day) {
    return Scaffold(
      backgroundColor: AppColor.gray,
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: EdgeInsets.only(left: AppSize.getWidth(context, 16)),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: AppSize.getHeight(context, 8.0)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_ios,
                      size: AppSize.getWidth(context, 16),
                      color: AppColor.lightBlue),
                  Text(
                    'Back',
                    style: TextStyle(
                        fontSize: AppSize.getFontSize(context, 16),
                        color: AppColor.lightBlue,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              final option = await Navigator.pushNamed(context, RoutesName.nudgeFilterPage);
              if (option != null) {
                // Handle the received option here
                print('Selected option: $option');
              }
            },
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/filter.png'),
                  height: AppSize.getHeight(context, 16),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: AppSize.getWidth(context, 4),
                      left: AppSize.getWidth(context, 4)),
                  child: Text(
                    'Filter',
                    style: TextStyle(
                        fontSize: AppSize.getFontSize(context, 16),
                        color: AppColor.lightBlue,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: AppSize.getWidth(context, 16)),
                  child: Text(
                    '(3)',
                    style: TextStyle(
                        fontSize: AppSize.getFontSize(context, 16),
                        color: AppColor.lightBlue,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Calendar(
              bloc: bloc,
              day: day,
            ),
            // const NudgeCard()
            NudgeSugesstions(),
          ],
        ),
      ),
    );
  }
}
