import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15),
      child: TabBar(
        isScrollable: true,
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.only(top: 15),
        tabs: [
          Text('Home'),
          Text('Videos'),
          Text('Shorts'),
          Text('Community'),
          Text('Playlists'),
          Text('Channels'),
          Text('About'),
        ],
      ),
    );
  }
}
