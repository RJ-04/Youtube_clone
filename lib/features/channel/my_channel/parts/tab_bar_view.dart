import 'package:flutter/material.dart';

class MyTabBarPages extends StatelessWidget {
  const MyTabBarPages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        children: [
          Center(child: Text('Home')),
          Center(child: Text('Videos')),
          Center(child: Text('Shorts')),
          Center(child: Text('Community')),
          Center(child: Text('Playslist')),
          Center(child: Text('Channel')),
          Center(child: Text('About')),
        ],
      ),
    );
  }
}
