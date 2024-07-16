import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/models.dart';
import 'package:flutterdemo/base/pages/available_friends_page/available_friends_bloc.dart';
import 'package:flutterdemo/base/pages/event_rsvp_details_page/event_rsvp_details_bloc.dart';
import 'package:flutterdemo/base/pages/nudges_inbox_page/nudge_inbox_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/widgets/FriendCard/friend_card.dart';
import 'package:flutterdemo/widgets/nudgecard.dart';

String convertDayOfWeek(int dayOfWeek) {
  String dayName = "";
  switch (dayOfWeek) {
    case 1:
      dayName = 'Monday';
      break;
    case 2:
      dayName = 'Tuesday';
      break;
    case 3:
      dayName = 'Wednesday';
      break;
    case 4:
      dayName = 'Thursday';
      break;
    case 5:
      dayName = 'Friday';
      break;
    case 6:
      dayName = 'Saturday';
      break;
    case 7:
      dayName = 'Sunday';
      break;
    default:
      dayName = 'Unknown';
  }
  return dayName;
}

Widget backButton(BuildContext context) {
  return Padding(
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
                size: AppSize.getWidth(context, 16), color: AppColor.lightBlue),
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
  );
}

void showDistanceOptions({
  required BuildContext context,
  required String selected,
  required List<String> options,
  required AvailableFriendsBloc bloc,
  required DateTime time,
}) {
  List<String> remains =
      options.where((element) => element != selected).toList();

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColor.gray,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(16)),
        ),
        // height: 200,
        child: Padding(
          padding: EdgeInsets.all(AppSize.getHeight(context, 16)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: AppSize.getFontSize(context, 16),
                        color: AppColor.blue),
                  ),
                  Text('Done',
                      style: TextStyle(
                          fontSize: AppSize.getFontSize(context, 16),
                          color: AppColor.blue)),
                ],
              ),
              Text(
                'Display Friends that are',
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 16),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 24),
              ),
              const Divider(
                color: Colors.black,
              ),
              Text(
                selected,
                style: TextStyle(fontSize: AppSize.getFontSize(context, 20)),
              ),
              const Divider(
                color: Colors.black,
              ),
              Column(
                children: remains.map((item) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppSize.getHeight(context, 4)),
                    child: GestureDetector(
                      onTap: () {
                        bloc.add(AvailableFriendsEventSelectDistance(
                            selected: item, time: time));
                        Navigator.pop(context);
                      },
                      child: Text(
                        item,
                        style: TextStyle(
                            fontSize: AppSize.getFontSize(context, 20)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void dialogBuilder(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Basic dialog title'),
        content: const Text(
          'A dialog is a type of modal window that\n'
          'appears in front of app content to\n'
          'provide critical information, or prompt\n'
          'for a decision to be made.',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

List<Widget> getMockFriends(BuildContext context, List<dynamic> friends,
    List<dynamic> selectedFriends) {
  List<Widget> nearby = <Widget>[];
  for (int i = 0; i < friends.length; i++) {
    nearby.add(FriendCard(
      id: '${friends[i]['id']}',
      selectedFriends: selectedFriends,
    ));
  }
  return nearby;
}

List<Widget> sendNudgeMockFriends(
    BuildContext context, List<dynamic> friends, List<dynamic> selectedFriends,
    {bool confirm = false}) {
  List<Widget> nearby = <Widget>[];
  for (int i = 0; i < friends.length; i++) {
    nearby.add(FriendCard(
      id: 'friends',
      selectedFriends: selectedFriends,
      confirm: confirm,
    ));
  }
  return nearby;
}

String convertTimeString(DateTime time) {
  int hour = time.hour;
  String midday = 'AM';
  if (hour >= 13) {
    midday = 'PM';
    hour = hour - 12;
  }

  String strHour = '$hour';
  if (hour < 10) {
    strHour = '0' + strHour;
  }

  int minute = time.minute;
  String strMinute = '$minute';
  if (minute < 10) {
    strMinute = '0$minute';
  }
  return '$strHour:$strMinute $midday';
}

Future<List<dynamic>> loadData() async {
  final jsonStr = await rootBundle.loadString('assets/MOCK_DATA.json');
  final jsonData = jsonDecode(jsonStr) as List<dynamic>;
  return jsonData;
}

Widget nudgeInboxCard(BuildContext context, String text, NudgeInboxBloc bloc,
    {String type = '', int count = 0}) {
  return GestureDetector(
    onTap: () {
      bloc.add(NudgeInboxEventClickOption(text));
    },
    child: SizedBox(
      height: 39,
      width: 106,
      child: Container(
        decoration: BoxDecoration(
          color: type == text ? AppColor.blue : AppColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text + ' (${count})',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: type == text ? AppColor.white : AppColor.black,
                fontSize: AppSize.getFontSize(context, 14)),
          ),
        ),
      ),
    ),
  );
}

Widget nudgeReceived(BuildContext context, NudgeInboxBloc bloc, String type,
    {List<NudgeObject> nudges = const []}) {
  List<String> types = ['New', 'Accepted', 'Declined'];
  List<int> numNudges = countNudges(nudges, types);
  List<Widget> cards = [];
  for (int i = 0; i < types.length; i++) {
    cards.add(nudgeInboxCard(context, types[i], bloc,
        type: type, count: numNudges[i]));
  }

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: cards,
  );
}

Widget nudgeSent(BuildContext context, NudgeInboxBloc bloc, String type,
    {List<NudgeObject> nudges = const []}) {
  List<String> types = ['Upcoming', 'Canceled'];
  List<int> numNudges = countNudges(nudges, types);
  List<Widget> cards = [];
  for (int i = 0; i < types.length; i++) {
    cards.add(nudgeInboxCard(context, types[i], bloc,
        type: type, count: numNudges[i]));
  }
  return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cards);
}

List<NudgeObject> mockNudges() {
  List<NudgeObject> nudges = [];
  for (int i = 0; i < 3; i++) {
    nudges.add(NudgeObject(widget: NudgeCard(plan: 'Demo'), type: 'New'));
  }
  nudges.add(NudgeObject(widget: NudgeCard(plan: 'Demo'), type: 'Accepted'));
  nudges.add(NudgeObject(widget: NudgeCard(plan: 'Demo'), type: 'Upcoming'));
  return nudges;
}

List<Widget> filteredNudges(
    List<NudgeObject> nudges, String type, BuildContext context) {
  List<Widget> res = nudges
      .where((element) => element.type == type)
      .map((item) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.eventRSVPDetailPage,
                arguments: <String, dynamic>{'nudgeWidget': item.widget});
          },
          child: item.widget))
      .toList();
  if (res.isNotEmpty) {
    return res;
  } else {
    return [
      const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Image(
            image: AssetImage('assets/no_nudges.png'),
          ),
        ),
      ),
      Text(
        'No $type nudges',
        style: TextStyle(
            fontSize: AppSize.getFontSize(context, 16),
            fontWeight: FontWeight.w500),
      )
    ];
  }
  return res;
}

List<int> countNudges(List<NudgeObject> nudges, List<String> types) {
  List<int> res = [];
  for (String type in types) {
    res.add(nudges.where((element) => element.type == type).toList().length);
  }
  return res;
}

Widget nudgeDetails(
    BuildContext context, String text, EventRsvpDetailsBloc bloc,
    {String type = '', int count = 0}) {
  return GestureDetector(
    onTap: () {
      bloc.add(EventRsvpDetailsEventClickOption(type:text));
    },
    child: SizedBox(
      height: 39,
      width: 106,
      child: Container(
        decoration: BoxDecoration(
          color: type == text ? AppColor.blue : AppColor.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            '$text ($count)',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: type == text ? AppColor.white : AppColor.black,
                fontSize: AppSize.getFontSize(context, 14)),
          ),
        ),
      ),
    ),
  );
}

List<Widget> rsvpTypes(
  BuildContext context,
  String type,
  EventRsvpDetailsBloc bloc,
    List<InvitedFriend> invited
) {
  return [
    nudgeDetails(context, 'Accepted', bloc, type: type,count: invited.where((element) => element.status=='Accepted').length),
    nudgeDetails(context, 'Declined', bloc, type:type,count: invited.where((element) => element.status=='Declined').length ),
    nudgeDetails(context, 'Need RSVP', bloc, type: type, count: invited.where((element) => element.status=='Need RSVP').length ),
  ];
}
String rsvpOptionDisplayed(String type){
  if (type=='Accepted'){
    return 'These friends have accepted your nudge:';
  }
  else if (type == 'Declined'){
    return 'These friends have declined your nudge:';
  }
  else{
    return 'These friends have not responded:';
  }
}
Widget friendRSVPCard(BuildContext context, {String name = 'Dori Doreau'}){
  return Column(
    children: [
      const Divider(color: AppColor.gray,),
      SizedBox(height: AppSize.getHeight(context, 8),),
      Padding(
        padding: EdgeInsets.symmetric(horizontal:AppSize.getWidth(context, 16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: AppSize.getWidth(context, 32),
                  backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D'),
                ),
                SizedBox(width: AppSize.getWidth(context, 8),),
                Text(name,style: TextStyle(fontWeight: FontWeight.w500,fontSize: AppSize.getFontSize(context, 16),),)
              ],
            ),
            Row(
              children: [
                Icon(Icons.messenger,color: AppColor.blue,size: AppSize.getHeight(context, 24),),
                SizedBox(width: AppSize.getWidth(context, 16),),
                Text('View Profile',style: TextStyle(fontWeight: FontWeight.w500,fontSize: AppSize.getFontSize(context, 14),color: AppColor.blue,)),
              ],
            )
          ],
        ),
      ),
      SizedBox(height: AppSize.getHeight(context, 8),),
      Divider(color: AppColor.gray,),
      SizedBox(height: AppSize.getHeight(context, 8),),
    ],
  );
}
List<InvitedFriend> getMockInvited(){
  List<InvitedFriend> res = [];
  for(int i=0; i<10;i++){
    res.add(InvitedFriend('John Doe', 'Accepted'));
  }
  for(int i=0; i<2;i++){
    res.add(InvitedFriend('Doris Lane', 'Declined'));
  }

  return res;
}
List<Widget> filteredInvited(List<InvitedFriend> invited, String option,BuildContext context){
  List<Widget> res = [];
  for (InvitedFriend friend in invited){
    if (friend.status==option){
      res.add(friendRSVPCard(context,name: friend.name));
    }
  }
  return res;
}