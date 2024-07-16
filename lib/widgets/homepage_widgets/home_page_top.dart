import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';

class HomePageTop extends StatefulWidget {
  const HomePageTop(
      {super.key,
      required this.today,
      required this.numEvents,
      required this.numFriends});

  final String today;
  final int numEvents;
  final int numFriends;

  @override
  State<HomePageTop> createState() => _HomePageTopState();
}

class _HomePageTopState extends State<HomePageTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
          )),
      child: Column(
        children: [
          Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColor.darkBlue,
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: SizedBox(
                width: AppSize.getWidth(context, 358),
                height: AppSize.getHeight(context, 206),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                    onTap: () {
                        Navigator.pushNamed(context, RoutesName.calendarLandingPage,
                            arguments: <String, dynamic>{
                              'today': widget.today,
                              'numEvents': widget.numEvents
                            });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSize.getHeight(context, 16)),
                            child: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: AppSize.getWidth(context, 24)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'My Plans',
                                      style: TextStyle(
                                          color: AppColor.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              AppSize.getFontSize(context, 24)),
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
                                                left: AppSize.getWidth(
                                                    context, 8)),
                                            child: Text(
                                              widget.today +
                                                  ' | ${widget.numEvents} Events',
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: AppSize.getFontSize(
                                                      context, 18)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                        Navigator.pushNamed(context, RoutesName.availableFriendsPage);
                        },
                        child: Container(
                          width: AppSize.getWidth(context, 358),
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(
                              color: AppColor.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: AppSize.getHeight(context, 8)),
                                child: SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: AppSize.getWidth(context, 24)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right:
                                                  AppSize.getWidth(context, 16)),
                                          child: Text('Available Friends',
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: AppSize.getFontSize(
                                                      context, 24),
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  AppSize.getHeight(context, 2)),
                                          child: SizedBox(
                                            width: AppSize.getWidth(context, 100),
                                            height:
                                                AppSize.getHeight(context, 24),
                                            child: FloatingActionButton(
                                              backgroundColor: AppColor.gray,
                                              onPressed: () => {},
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_pin,
                                                    color: Colors.green,
                                                  ),
                                                  Text(
                                                    ' See map',
                                                    style: TextStyle(
                                                        fontSize:
                                                            AppSize.getFontSize(
                                                                context, 16),
                                                        color: AppColor.black),
                                                  ),
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
                              Padding(
                                padding: EdgeInsets.only(
                                    top: AppSize.getHeight(context, 4)),
                                child: SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: AppSize.getWidth(context, 24)),
                                    child: Row(
                                      children: [
                                        Text('${widget.numFriends} Friends',
                                            style: TextStyle(
                                                color: AppColor.black,
                                                fontSize: AppSize.getFontSize(
                                                    context, 18),
                                                fontWeight: FontWeight.bold)),
                                        Text(' available NOW!',
                                            style: TextStyle(
                                              color: AppColor.black,
                                              fontSize: AppSize.getFontSize(
                                                  context, 18),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
