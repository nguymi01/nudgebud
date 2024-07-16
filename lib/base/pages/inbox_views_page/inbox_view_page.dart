import 'package:flutter/material.dart';

class InboxViewPage extends StatefulWidget {
  const InboxViewPage({super.key});

  @override
  State<InboxViewPage> createState() => _InboxViewPageState();
}

class _InboxViewPageState extends State<InboxViewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
