import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../cores/screens/loader.dart';
import '../../../auth/provider/user_provider.dart';
import '../parts/buttons.dart';
import '../parts/header.dart';
import '../parts/tab_bar.dart';
import '../parts/tab_bar_view.dart';

class MyChannelScreen extends ConsumerWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
          data: (currentUser) {
            return DefaultTabController(
              length: 7,
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Header(user: currentUser),

                        //--------------------------------------------------------------------

                        const Text('More about this channel'),

                        //--------------------------------------------------------------------

                        const MyChannelButtons(),

                        //--------------------------------------------------------------------

                        const MyTabBar(),

                        //--------------------------------------------------------------------

                        const MyTabBarPages()
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Loader(),
        );
  }
}
