import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/models.dart';
import 'package:flutterdemo/base/pages/event_rsvp_details_page/event_rsvp_details_bloc.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/tools.dart';

class EventRSVPDetailPage extends StatefulWidget {
  const EventRSVPDetailPage({super.key, required this.nudge});

  final Widget nudge;

  @override
  State<EventRSVPDetailPage> createState() => _EventRSVPDetailPageState();
}

class _EventRSVPDetailPageState extends State<EventRSVPDetailPage> {
  EventRsvpDetailsBloc bloc = EventRsvpDetailsBloc();
  String type = 'Accepted';
  List<InvitedFriend> invited = getMockInvited();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventRsvpDetailsBloc, EventRsvpDetailsState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is EventRsvpDetailsInitial) {
          return mainView(context, 'Accepted',
              invited);
        } else if (state is EventRsvpDetailsStateDisplayOption) {
          type = state.type;
          return mainView(context, state.type,
              invited);
        }
        return Container();
      },
    );
  }

  Widget mainView(
      BuildContext context, String type,List<InvitedFriend> invited) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,
              size: AppSize.getWidth(context, 32), color: AppColor.lightBlue),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppSize.getHeight(context, 48)),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppSize.getWidth(context, 16)),
                child: Text(
                  'Details',
                  style: TextStyle(
                      fontSize: AppSize.getFontSize(context, 32),
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.nudge,
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.getWidth(context, 16),
                right: AppSize.getWidth(context, 16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: rsvpTypes(context, type, bloc,invited),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppSize.getWidth(context, 16),
                top: AppSize.getHeight(context, 16),
                bottom: AppSize.getHeight(context, 16),
              ),
              child: Text(
                rsvpOptionDisplayed(type),
                style: TextStyle(
                    fontSize: AppSize.getFontSize(context, 14),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              children: filteredInvited(invited, type, context),
            ),
          ],
        ),
      ),
    );
  }
}
