import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/calendar_expanded_page/calendar_expanded_bloc.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key, required this.bloc, required this.day});
  final CalendarExpandedBloc bloc;
  final DateTime day;
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // DateTime today = DateTime.now();
  void _ondaySelected(DateTime day, DateTime focusedDay){
    widget.bloc.add(CalendarExpandedEventChooseDate(date: day));
    setState(() {
      focusedDay;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(AppSize.getWidth(context, 8)),
      child: Container(
          decoration: const  BoxDecoration(
                  color: AppColor.white,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(AppSize.getWidth(context, 16)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.calendar_month,color: AppColor.black,size: AppSize.getWidth(context, 30),),
                  SizedBox(width: AppSize.getWidth(context, 8),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Plans',
                        style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.getFontSize(context, 24)),
                      ),
                      Text(
                        'view your saved events',
                        style: TextStyle(
                            color: AppColor.darkGray,
                            // fontWeight: FontWeight.bold,
                            fontSize: AppSize.getFontSize(context, 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TableCalendar(
              locale: 'en_US',
                focusedDay: widget.day,

                selectedDayPredicate: (day)=>isSameDay(day,widget.day),

                headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
                availableGestures: AvailableGestures.all,
                firstDay: DateTime.utc(2014, 04, 01),
                lastDay: DateTime.utc(2030,01,01),
                onDaySelected: _ondaySelected,

            ),
          ],
        ),
      ),
    );
  }
}
