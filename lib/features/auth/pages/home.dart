import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cores/screens/error_screen.dart';
import '../../../cores/screens/loader.dart';
import '../../../cores/widgets/image_button.dart';
import '../../../pages_list.dart';
import '../../account/account.dart';
import '../../content/bottom_nav_bar.dart';
import '../../upload/upload_sheet.dart';
import '../provider/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                          child: GestureDetector(
                            onTap: () async => await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AccountPage(user: currentUser),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey,
                              backgroundImage: CachedNetworkImageProvider(
                                currentUser.profilePic,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),

            //--------------------------------------------------------------------

            Expanded(child: pages[_currentIndex]),
          ],
        ),
      ),

      //--------------------------------------------------------------------

      bottomNavigationBar: BottomNavigation(
        onPressed: (index) async {
          if (index != 2) {
            _currentIndex = index;
            setState(() {});
          } else {
            showModalBottomSheet(
              sheetAnimationStyle:
                  AnimationStyle(duration: const Duration(milliseconds: 500)),
              context: context,
              builder: (context) => const CreateBottomSheet(),
            );
          }
        },
      ),
    );
  }
}
