import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cores/buttons/image_button.dart';
import '../../../cores/screens/error_screen.dart';
import '../../../cores/screens/loader.dart';
import '../provider/user_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/youtube.jpg', height: 36),

                //--------------------------------------------------------------------

                const SizedBox(width: 4),
                const Spacer(),

                //--------------------------------------------------------------------

                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    height: 42,
                    child: ImageButton(
                      image: 'cast.png',
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),

                //--------------------------------------------------------------------

                SizedBox(
                  height: 38,
                  child: ImageButton(
                    image: 'notification.png',
                    onPressed: () {},
                    haveColor: false,
                  ),
                ),

                //--------------------------------------------------------------------

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 15),
                  child: SizedBox(
                    height: 41.5,
                    child: ImageButton(
                      image: 'search.png',
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),

                //--------------------------------------------------------------------

                Consumer(
                  builder: (context, ref, child) {
                    return ref.watch(currentUserProvider).when(
                      error: (error, stackTrace) {
                        return ErrorPage(error: error.toString());
                      },
                      loading: () {
                        return const Loader();
                      },
                      data: (currentUser) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey,
                            backgroundImage: CachedNetworkImageProvider(
                                currentUser.profilePic),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
