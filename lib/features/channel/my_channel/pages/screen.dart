import 'package:flutter/material.dart';

import '../parts/buttons.dart';
import '../parts/header.dart';
import '../parts/tab_bar.dart';
import '../parts/tab_bar_view.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 7,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Header(),

                //--------------------------------------------------------------------

                Text('More about this channel'),

                //--------------------------------------------------------------------

                MyChannelButtons(),

                //--------------------------------------------------------------------

                MyTabBar(),

                //--------------------------------------------------------------------

                MyTabBarPages()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
