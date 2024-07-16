import 'package:flutter/material.dart';
import 'package:flutterdemo/base/size.dart';

class FriendsGridView extends StatefulWidget {
  const FriendsGridView({super.key, required this.friendList});
  final List<Widget> friendList;
  @override
  State<FriendsGridView> createState() => _FriendsGridViewState();
}

class _FriendsGridViewState extends State<FriendsGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      mainAxisSpacing: AppSize.getHeight(context, 8),
      crossAxisCount: 2,
      crossAxisSpacing: AppSize.getWidth(context, 8),
      children: widget.friendList,
    );
  }
}
