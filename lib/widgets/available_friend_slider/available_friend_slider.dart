import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/available_friends_page/available_friends_bloc.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/tools.dart';

class AvailableFriendSlider extends StatefulWidget {
  const AvailableFriendSlider(
      {super.key,
      required this.bloc,
      required this.selected,
      required this.time});

  final AvailableFriendsBloc bloc;
  final String selected;
  final DateTime time;

  @override
  State<AvailableFriendSlider> createState() => _AvailableFriendSliderState();
}

class _AvailableFriendSliderState extends State<AvailableFriendSlider> {
  List<String> options = ['Any Distance From Me', '5 mi', '10 mi', '20 mi'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSize.getWidth(context, 16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: AppSize.getWidth(context, 36)),
                  child: Text('Available Friends',
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: AppSize.getFontSize(context, 23),
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  width: AppSize.getWidth(context, 91),
                  height: AppSize.getHeight(context, 32),
                  child: FloatingActionButton(
                    backgroundColor: AppColor.gray,
                    onPressed: () => {},
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: AppSize.getWidth(context, 4)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.green,
                            size: AppSize.getHeight(context, 14),
                          ),
                          Text(
                            ' See map',
                            style: TextStyle(
                                fontSize: AppSize.getFontSize(context, 14),
                                color: AppColor.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('23 Friends',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: AppSize.getFontSize(context, 16),
                        fontWeight: FontWeight.bold)),
                Text(' available NOW!',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: AppSize.getFontSize(context, 16),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: AppSize.getHeight(context, 14),
                  bottom: AppSize.getHeight(context, 14)),
              child: Text(
                'Show Friends Available Until',
                style: TextStyle(fontSize: AppSize.getFontSize(context, 13)),
              ),
            ),
            Center(
              child: Text(
                convertTimeString(widget.time),
                style: TextStyle(fontSize: AppSize.getFontSize(context, 20)),
              ),
            ),
            Slider(
              value: (widget.time.hour * 60 + widget.time.minute).toDouble(),
              max: 1440,
              divisions: 96,
              label: convertTimeString(widget.time),
              activeColor: AppColor.blue,
              inactiveColor: AppColor.gray,
              onChanged: (double value) {
                DateTime newTime = DateTime(widget.time.year, widget.time.month,
                    widget.time.day, (value ~/ 60), (value % 60).toInt());
                widget.bloc.add(AvailableFriendsEventSelectDistance(
                    selected: widget.selected, time: newTime));
              },
            ),
            GestureDetector(
              onTap: () {
                showDistanceOptions(
                  context: context,
                  options: options,
                  selected: widget.selected,
                  time: widget.time,
                  bloc: widget.bloc,
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColor.gray,
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.getWidth(context, 16),
                    vertical: AppSize.getHeight(context, 8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.selected,
                        style: TextStyle(
                            fontSize: AppSize.getFontSize(context, 19)),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: AppSize.getHeight(context, 24),
                      )
                    ],
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
