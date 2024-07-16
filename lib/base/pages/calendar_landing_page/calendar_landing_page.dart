import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/calendar_landing_page/calendar_landing_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/main.dart';
import 'package:flutterdemo/widgets/nudgecard.dart';

class CalendarLandingPage extends StatefulWidget {
  const CalendarLandingPage(
      {super.key, required this.today, required this.numEvents});

  final String today;
  final int numEvents;

  @override
  State<CalendarLandingPage> createState() => _CalendarLandingPageState();
}

class _CalendarLandingPageState extends State<CalendarLandingPage> {
  CalendarLandingBloc bloc = CalendarLandingBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is CalendarLandingInitial) {
          return mainView(context);
        }
        return Container();
      },
    );
  }

  Widget mainView(BuildContext context) {
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
              child: Text(
                'Close',
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 16),
                    color: AppColor.lightBlue,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(AppSize.getWidth(context, 8)),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.calendarExpandedPage,
                      arguments: <String, dynamic>{
                        'numEvents': widget.numEvents,
                        'today': widget.today,
                      });
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColor.darkBlue,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: AppSize.getHeight(context, 16),
                        left: AppSize.getWidth(context, 24),
                        right: AppSize.getWidth(context, 24)),
                    child: SizedBox(
                      height: AppSize.getHeight(context, 180),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Plans',
                            style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.bold,
                                fontSize: AppSize.getFontSize(context, 24)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: AppSize.getHeight(context, 8)),
                            child: Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColor.white,
                                        // Border color
                                        width: 2, // Border width
                                      ),
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      size: 16,
                                      Icons.notifications,
                                      color: AppColor.white,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: AppSize.getWidth(context, 8)),
                                  child: Text(
                                    '${widget.today} | ${widget.numEvents} Events',
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            AppSize.getFontSize(context, 18)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: AppSize.getHeight(context, 32)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: AppColor.white,
                                    // Border color
                                    width: 1, // Border width
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(64))),
                              child: Padding(
                                padding: EdgeInsets.all(
                                    AppSize.getWidth(context, 16.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: AppColor.white,
                                          size: AppSize.getHeight(context, 24),
                                        ),
                                        SizedBox(
                                          width: AppSize.getWidth(context, 16),
                                        ),
                                        Text(
                                          'Calendar View',
                                          style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: AppSize.getFontSize(
                                                  context, 16)),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios,
                                        color: AppColor.white)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: AppSize.getWidth(context, 16),
                  top: AppSize.getHeight(context, 24)),
              child: Text(
                "Today's Nudges (${widget.numEvents})",
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 16),
                    fontWeight: FontWeight.bold),
              ),
            ),
            NudgeCard(plan: 'Late Night Dinner With Friends'),
            NudgeCard(plan: 'San Diego Exotic Plan Tour',)
          ],
        ),
      ),
    );
  }
}
