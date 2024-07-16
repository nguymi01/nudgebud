import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/calendar_expanded_page/nudge_filter_page/nudge_filter_bloc.dart';
import 'package:flutterdemo/base/size.dart';

class NudgeFilter extends StatefulWidget {
  const NudgeFilter({super.key});

  @override
  State<NudgeFilter> createState() => _NudgeFilterState();
}

class _NudgeFilterState extends State<NudgeFilter> {
  NudgeFilterBloc bloc = NudgeFilterBloc();

  @override
  void initState() {
    super.initState();
    bloc.add(NudgeFilterEventClickButton(value: 'View all Nudges'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is NudgeFilterInitial) {
            return mainScreen(context, 'View all Nudges');
          } else if (state is NudgeFilterStateShowChosenValue) {
            print(state.value);
            return mainScreen(context, state.value);
          }
          return Container();
        });
  }

  Widget mainScreen(BuildContext context, String groupValue) {
    return Scaffold(
      backgroundColor: AppColor.lightGray,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.only(
              left: AppSize.getWidth(context, 16),
              right: AppSize.getWidth(context, 16)),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context,groupValue);
            },
            child: Center(
              child: Text(
                'Close',
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 19),
                    color: AppColor.lightBlue,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Filters',
          style: TextStyle(
              fontSize: AppSize.getFontSize(context, 19),
              color: AppColor.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSize.getWidth(context, 16)),
            child: Text(
              'Reset',
              style: TextStyle(
                  fontSize: AppSize.getFontSize(context, 19),
                  color: AppColor.grayFont,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: AppSize.getWidth(context, 16),
            top: AppSize.getHeight(context, 24)),
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  value: 'View all Nudges',
                  groupValue: groupValue,
                  onChanged: (value) {
                    bloc.add(
                        NudgeFilterEventClickButton(value: value.toString()));
                  },
                ),
                SizedBox(
                  width: AppSize.getWidth(context, 16),
                ),
                Text(
                  'View all Nudges',
                  style: TextStyle(
                      fontSize: AppSize.getHeight(context, 16),
                      fontWeight: groupValue == 'View all Nudges'
                          ? FontWeight.bold
                          : FontWeight.w400),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'View only Nudges I accepted',
                  groupValue: groupValue,
                  onChanged: (value) {
                    bloc.add(
                        NudgeFilterEventClickButton(value: value.toString()));
                  },
                ),
                SizedBox(
                  width: AppSize.getWidth(context, 16),
                ),
                Text(
                  'View only Nudges I accepted',
                  style: TextStyle(
                      fontSize: AppSize.getHeight(context, 16),
                      fontWeight: groupValue == 'View only Nudges I accepted'
                          ? FontWeight.bold
                          : FontWeight.w400),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'View only Nudges I created',
                  groupValue: groupValue,
                  onChanged: (value) {
                    bloc.add(
                        NudgeFilterEventClickButton(value: value.toString()));
                  },
                ),
                SizedBox(
                  width: AppSize.getWidth(context, 16),
                ),
                Text(
                  'View only Nudges I created',
                  style: TextStyle(
                      fontSize: AppSize.getHeight(context, 16),
                      fontWeight: groupValue == 'View only Nudges I created'
                          ? FontWeight.bold
                          : FontWeight.w400),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
