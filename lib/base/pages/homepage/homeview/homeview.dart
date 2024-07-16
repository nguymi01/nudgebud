import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/homepage/homepage_bloc.dart';
import 'package:flutterdemo/base/pages/homepage/homeview/homeview_bloc.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/widgets/homepage_widgets/home_page_top.dart';
import 'package:flutterdemo/widgets/homepage_widgets/homepage_bot_widget.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget  {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeviewBloc bloc = HomeviewBloc();
  int numFriends = 23;
  int numEvents = 2;
  String today = DateFormat('EEE, MMM d').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeviewBloc, HomeviewState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is HomeviewInitial) {
          return mainView(context);
        }
        return Container();
      },
    );
  }

  Widget mainView(BuildContext context){
    return Padding(
    padding: EdgeInsets.only(top: AppSize.getHeight(context, 16.0)),
    child: Container(
      color: AppColor.gray,
      child: Column(
        children: [
          HomePageTop(
            key: widget.key,
            numEvents: numEvents,
            numFriends: numFriends,
            today: today,
          ),
          const HomePageBot(),
        ],
      ),
    ),
    );
  }
}
