import 'package:flutter/material.dart';

import '../../../../cores/colors.dart';
import '../../../../cores/widgets/flat_button.dart';
import '../widgets/externel_buttons.dart';

class Video extends StatelessWidget {
  const Video({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,

        //--------------------------------------------------------------------

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(175),
          child: GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Positioned(
                  left: 180,
                  top: 85,
                  child: GestureDetector(
                    onTap: () {},
                    child: SizedBox(height: 50, child: Container()),
                  ),
                ),

                //--------------------------------------------------------------------

                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(height: 7.5, child: Container()),
                ),
              ],
            ),
          ),
        ),
      ),

      //--------------------------------------------------------------------

      body: SafeArea(
        child: ListView(
          children: [
            const Text(
              'How to learn Flutter quickly',
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),

            //--------------------------------------------------------------------

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'No view',
                      style: TextStyle(fontSize: 15, color: Color(0xff5F5F5F)),
                    ),
                  ),
                ],
              ),
            ),

            //--------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                children: [
                  const CircleAvatar(radius: 15, backgroundColor: Colors.grey),

                  //--------------------------------------------------------------------

                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      'Ahmad Amini',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),

                  //--------------------------------------------------------------------

                  SizedBox(
                    height: 35,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: FlatButton(
                        text: 'Subscribe',
                        onPressed: () {},
                        colour: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //--------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: const BoxDecoration(
                        color: softBlueGreyBackGround,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.thumb_up, size: 15),
                          ),

                          //--------------------------------------------------------------------
                          const SizedBox(width: 5),
                          //--------------------------------------------------------------------

                          const Icon(Icons.thumb_down, size: 15),
                        ],
                      ),
                    ),

                    //--------------------------------------------------------------------

                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: VideoExtraButton(
                        text: 'Share',
                        iconData: Icons.share,
                      ),
                    ),

                    //--------------------------------------------------------------------

                    const VideoExtraButton(
                      text: 'Remix',
                      iconData: Icons.analytics_outlined,
                    ),

                    //--------------------------------------------------------------------

                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: VideoExtraButton(
                        text: 'Download',
                        iconData: Icons.download,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
