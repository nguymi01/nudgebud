import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/tools.dart';
import 'package:flutterdemo/widgets/curstom_button.dart';
import 'package:flutterdemo/widgets/friends_grid_view/friends_grid_view.dart';

class SendNudgePage extends StatefulWidget {
  const SendNudgePage({super.key, required this.selectedFriends});

  final List<dynamic> selectedFriends;

  @override
  State<SendNudgePage> createState() => _SendNudgePageState();
}

class _SendNudgePageState extends State<SendNudgePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightGray,
        appBar: AppBar(
          leading: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.blue,
                  size: AppSize.getHeight(context, 24),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: AppSize.getWidth(context, 24)),
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 19),
                    fontWeight: FontWeight.w500,
                    color: AppColor.blue),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.getWidth(context, 24),
                vertical: AppSize.getHeight(context, 8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AppSize.getHeight(context, 16)),
                  child: Text(
                    'Send Nudge',
                    style: TextStyle(
                        fontSize: AppSize.getFontSize(context, 32),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Confirm your selections:',
                      style:
                          TextStyle(fontSize: AppSize.getFontSize(context, 16)),
                    ),
                    FriendsGridView(
                      friendList: sendNudgeMockFriends(context,
                          widget.selectedFriends, widget.selectedFriends,
                          confirm: true),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: AppColor.lightGray,
          child: Container(
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
            child: Padding(
              padding: EdgeInsets.all(AppSize.getWidth(context, 16)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppSize.getHeight(context, 16)),
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        child: SizedBox(
                          width: AppSize.getWidth(context, 275),
                          height: AppSize.getHeight(context, 48),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: AppSize.getWidth(context, 16),
                                right: AppSize.getWidth(context, 16)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: AppSize.getWidth(context, 8)),
                                  child: const Icon(
                                    Icons.location_pin,
                                    color: AppColor.white,
                                  ),
                                ),
                                Text(
                                  'Map it!',
                                  style: TextStyle(
                                      fontSize: AppSize.getFontSize(context, 16),
                                      color: AppColor.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Send a map invitation instantly!',
                    style:
                        TextStyle(fontSize: AppSize.getFontSize(context, 13)),
                  ),
                  SizedBox(height: AppSize.getHeight(context, 16),),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      decoration:  BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.blue),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                      child: SizedBox(
                        width: AppSize.getWidth(context, 275),
                        height: AppSize.getHeight(context, 48),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: AppSize.getWidth(context, 16),
                              right: AppSize.getWidth(context, 16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'Create Invitation',
                                style: TextStyle(
                                    fontSize: AppSize.getFontSize(context, 16),
                                    color: AppColor.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(context, 16),),
                ],
              ),
            ),
          ),
        ));
  }
}
