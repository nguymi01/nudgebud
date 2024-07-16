import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdemo/base/color.dart';
import 'package:flutterdemo/base/models.dart';
import 'package:flutterdemo/base/pages/nudges_inbox_page/nudge_inbox_bloc.dart';
import 'package:flutterdemo/base/size.dart';
import 'package:flutterdemo/base/tools.dart';

class NudgeInboxPage extends StatefulWidget {
  const NudgeInboxPage({super.key});

  @override
  State<NudgeInboxPage> createState() => _NudgeInboxPageState();
}

class _NudgeInboxPageState extends State<NudgeInboxPage> {
  NudgeInboxBloc bloc = NudgeInboxBloc();
  String type = 'New';
  bool _isReceived = true;
  List<NudgeObject> nudges = mockNudges();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    bloc.add(NudgeInboxEventClickReceivedTab());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NudgeInboxBloc, NudgeInboxState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is NudgeInboxInitial) {
            _isReceived = true;
            return mainView(context, nudgeReceived(context, bloc, 'New',nudges: nudges),
                _isReceived, 'New');
          } else if (state is NudgeInboxStateSent) {
            _isReceived = false;
            return mainView(context, nudgeSent(context, bloc, 'Upcoming',nudges: nudges),
                _isReceived, 'Upcoming');
          } else if (state is NudgeInboxStateReceived) {
            _isReceived = true;
            return mainView(context, nudgeReceived(context, bloc, 'New',nudges: nudges),
                _isReceived, 'New');
          } else if (state is NudgeInboxStateDisplayOption) {
            type = state.type;
            return mainView(
                context,
                _isReceived
                    ? nudgeReceived(context, bloc, type,nudges: nudges)
                    : nudgeSent(context, bloc, type,nudges: nudges),
                _isReceived,
                type);
          }
          return Container();
        });
  }

  Widget mainView(
      BuildContext context, Widget filter, bool isReceived, String type) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: AppSize.getHeight(context, 64),
              bottom: AppSize.getHeight(context, 16),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    bloc.add(NudgeInboxEventClickReceivedTab());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: isReceived ? 3.0 : 0,
                            color:
                                isReceived ? Colors.black : AppColor.lightGray),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: AppSize.getWidth(context, 16),
                        ),
                        const Icon(Icons.inbox),
                        SizedBox(
                          width: AppSize.getWidth(context, 16),
                        ),
                        Text(
                          'Received',
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 16),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    bloc.add(NudgeInboxEventClickSentTab());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: isReceived == false ? 3.0 : 0,
                            color: isReceived == false
                                ? Colors.black
                                : AppColor.lightGray),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.inbox),
                        SizedBox(
                          width: AppSize.getWidth(context, 16),
                        ),
                        Text(
                          'Sent',
                          style: TextStyle(
                              fontSize: AppSize.getFontSize(context, 16),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: AppSize.getWidth(context, 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          filter,
          Column(children: filteredNudges(nudges, type,context)),
        ],
      ),
    );
  }
}
