import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/homepage/homepage_bloc.dart';
import 'package:flutterdemo/base/size.dart';

class BottomHomeNavBar extends StatefulWidget {
  const BottomHomeNavBar({super.key, required this.bloc, required this.widgetOptions});
  final HomepageBloc bloc;
  final List<Widget> widgetOptions;

  @override
  State<BottomHomeNavBar> createState() => _BottomHomeNavBarState();
}

class _BottomHomeNavBarState extends State<BottomHomeNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.gray,
      child: Container(
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(24))),
          child: Padding(
            padding: EdgeInsets.all(AppSize.getWidth(context, 16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: (){
                    widget.bloc.add(HomepageEventClickTab(0));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home_filled,
                        size: AppSize.getHeight(context, 24),
                      ),
                      Text('Home',
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 16))),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    widget.bloc.add(HomepageEventClickTab(1));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.wallet_outlined,
                        size: AppSize.getHeight(context, 24),
                      ),
                      Text('Nudges',
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 16))),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AppSize.getHeight(context, 8)),
                  child: IconButton(
                    onPressed: () {
                      widget.bloc.add(HomepageClickButtonTestEvent());
                    },
                    icon: Image.asset('assets/nudge_button.png',),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    widget.bloc.add(HomepageEventClickTab(2));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.groups,
                        size: AppSize.getHeight(context, 24),
                      ),
                      Text('Friends',
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 16))),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    widget.bloc.add(HomepageEventClickTab(3));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.menu,
                        size: AppSize.getHeight(context, 24),
                      ),
                      Text('More',
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 16))),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
