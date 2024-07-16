import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/available_friends_page/available_friends_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/tools.dart';
import 'package:flutterdemo/widgets/available_friend_slider/available_friend_slider.dart';
import 'package:flutterdemo/widgets/curstom_button.dart';
import 'package:flutterdemo/widgets/friends_grid_view/friends_grid_view.dart';

class AvailableFriendsPage extends StatefulWidget {
  const AvailableFriendsPage({super.key});

  @override
  State<AvailableFriendsPage> createState() => _AvailableFriendsPageState();
}

class _AvailableFriendsPageState extends State<AvailableFriendsPage> {
  AvailableFriendsBloc bloc = AvailableFriendsBloc();
  List<dynamic> friendsList = [];
  List<dynamic> nearbyFriends = [];
  List<dynamic> longDistanceFriends = [];
  List<dynamic> selectedFriends = [];

  @override
  void initState() {
    super.initState();
    bloc.add(AvailableFriendsEventCallData());
    // bloc.add(AvailableFriendsEventSelectDistance(
    //     selected: 'Any Distance From Me', time: DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableFriendsBloc, AvailableFriendsState>(
      bloc: bloc,
      builder: (context, state) {
        // print(selectedFriends);
        if (state is AvailableFriendsStateShowDistance) {
          return mainView(context, state.selected, state.time, friendsList);
        } else if (state is AvailableFriendsStateLoadData) {
          friendsList = state.friends;
          for (int i = 0; i < 8; i++) {
            nearbyFriends.add(friendsList[i]);
          }
          for (int i = 8; i < 20; i++) {
            longDistanceFriends.add(friendsList[i]);
          }

          return mainView(
              context, 'Any Distance From Me', DateTime.now(), friendsList);
        } else if (state is AvailableFriendsInitial) {
          return mainView(context, 'Any Distance From Me', DateTime.now(), []);
        } else {
          return Container();
        }
      },
      buildWhen: (AvailableFriendsState prev, AvailableFriendsState current) {
        if (current is AvailableFriendsStateShowDistance) {
          return true;
        } else {
          return true;
        }
      },
    );
  }

  Widget mainView(BuildContext context, String selected, DateTime time,
      List<dynamic> friendsList) {
    return Scaffold(
      backgroundColor: AppColor.lightBlue,
      appBar: AppBar(
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.only(
              left: AppSize.getWidth(context, 24),
              top: AppSize.getHeight(context, 16)),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Close',
              style: TextStyle(
                  fontSize: AppSize.getFontSize(context, 19),
                  color: AppColor.lightBlue,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(
                  right: AppSize.getWidth(context, 24),
                  top: AppSize.getHeight(context, 16)),
              child: Row(
                children: [
                  Image(
                    image: const AssetImage('assets/filter.png'),
                    height: AppSize.getHeight(context, 19),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: AppSize.getWidth(context, 4),
                        left: AppSize.getWidth(context, 4)),
                    child: Text(
                      'Sort',
                      style: TextStyle(
                          fontSize: AppSize.getFontSize(context, 19),
                          color: AppColor.lightBlue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.getWidth(context, 16),
              vertical: AppSize.getHeight(context, 16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: AppSize.getHeight(context, 16)),
                child: AvailableFriendSlider(
                  bloc: bloc,
                  selected: selected,
                  time: time,
                ),
              ),
              Container(
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
                        children: [
                          Text(
                            'Nearby Friends (${8})',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.getFontSize(context, 18),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Located less than 20 mil from you',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.darkGray),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppSize.getHeight(context, 16)),
                        child: CustomButton(
                          leftIcon: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: AppSize.getHeight(context, 16),
                          ),
                          rightIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: AppSize.getHeight(context, 16),
                          ),
                          text: 'View Friends Map',
                          onClick: () => {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppSize.getHeight(context, 16)),
                        child: FriendsGridView(
                          friendList: getMockFriends(
                              context, nearbyFriends, selectedFriends),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.getHeight(context, 16),
              ),
              Container(
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
                        children: [
                          Text(
                            'Long distance Friends (${12})',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.getFontSize(context, 18),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppSize.getHeight(context, 16),
                            bottom: AppSize.getHeight(context, 16)),
                        child: FriendsGridView(
                          friendList: getMockFriends(
                              context, longDistanceFriends, selectedFriends),
                        ),
                      ),
                      Center(
                        child: CustomButton(
                          text: 'Next',
                          onClick: () => Navigator.pushNamed(
                              context, RoutesName.sendNudgePage,
                              arguments: <String, dynamic>{
                                'selectedFriends': selectedFriends,
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
