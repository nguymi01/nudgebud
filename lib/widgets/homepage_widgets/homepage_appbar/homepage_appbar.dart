import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/homepage/homepage_bloc.dart';
import 'package:flutterdemo/base/route.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageAppBar extends StatefulWidget {
  const HomepageAppBar({super.key, required this.bloc, required this.status});
  final HomepageBloc bloc;
  final bool status;
  @override
  State<HomepageAppBar> createState() => _HomepageAppBarState();
}

class _HomepageAppBarState extends State<HomepageAppBar> {

  @override
  Widget build(BuildContext context) {
    return mainView(context, widget.status);
  }

  Widget mainView(BuildContext context, bool status) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: AppSize.getWidth(context, 160),
      actions: [
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.white,
                // Border color
                width: 2, // Border width
              ),
              color: AppColor.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: AppColor.black,
                ))),
        Padding(
          padding: EdgeInsets.only(right: AppSize.getWidth(context, 24)),
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.white,
                  // Border color
                  width: 2, // Border width
                ),
                color: AppColor.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context,RoutesName.signUpPage);
                  },
                  icon: const Icon(
                    Icons.messenger,
                    color: AppColor.black,
                  ))),
        )
      ],
      leading: Padding(
        padding: EdgeInsets.only(left: AppSize.getWidth(context, 24)),
        child: GestureDetector(
          onTap: (){
            widget.bloc.add(HomepageEventClickStatus(!status));
          },
          child: Container(
            padding: EdgeInsets.only(left: AppSize.getWidth(context, 8)),
            decoration: const BoxDecoration(
                color: AppColor.lightGray,
                borderRadius: BorderRadius.all((Radius.circular(24)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.status? const Icon(
                  Icons.circle,
                  color: Colors.green,
                ):const Icon(
                  Icons.circle,
                  color: Colors.red,
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: AppSize.getWidth(context, 8)),
                  child: status? Text(
                    "I'm available",
                    style:
                    TextStyle(fontSize: AppSize.getFontSize(context, 14)),
                  ):Text(
                    "I'm busy",
                    style:
                    TextStyle(fontSize: AppSize.getFontSize(context, 14)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
