import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/pages/homepage/homepage_bloc.dart';
import 'package:flutterdemo/base/pages/homepage/homeview/homeview.dart';
import 'package:flutterdemo/base/pages/nudges_inbox_page/nudge_inbox_page.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/tools.dart';
import 'package:flutterdemo/widgets/homepage_widgets/home_bottom_nav_bar.dart';
import 'package:flutterdemo/widgets/homepage_widgets/homepage_appbar/homepage_appbar.dart';
import 'package:flutterdemo/widgets/homepage_widgets/homepage_bot_widget.dart';
import 'package:flutterdemo/widgets/homepage_widgets/home_page_top.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomepageBloc bloc = HomepageBloc();
  List<Widget> _widgetOptions = <Widget>[const HomeView(),NudgeInboxPage(),Container(),Container()];
  int _selectedIndex = 0;
  bool currStatus = true;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is HomepageInitial) {
          return mainView(context, currStatus,0);
        } else if (state is HomepageStateStatusUpdated) {
          currStatus = state.status;
          return mainView(context, state.status,_selectedIndex);
        }
        else if (state is HomepageStateUpdateIndex){
          _selectedIndex = state.index;
          return mainView(context, currStatus,state.index);
        }

        return Container();
      },
      buildWhen: (HomepageState prev, HomepageState current) {
        if (current is HomepageStateShowPopUp) {
          dialogBuilder(context);
          return false;
        } else {
          return true;
        }
      },
    );
  }

  int numFriends = 23;
  int numEvents = 2;
  String today = DateFormat('EEE, MMM d').format(DateTime.now());

  Widget mainView(BuildContext context, bool status,int index) {
    return Scaffold(
      backgroundColor: index==0?AppColor.blue:AppColor.gray,
      appBar: index==0?PreferredSize(
          preferredSize: Size.fromHeight(AppSize.getHeight(context, 31)),
          child: HomepageAppBar(
            bloc: bloc,
            status: status,
          )):null,
      body: _widgetOptions.elementAt(index),
      bottomNavigationBar: BottomHomeNavBar(
        bloc: bloc,
        widgetOptions: _widgetOptions,
      ),
    );
  }
}
