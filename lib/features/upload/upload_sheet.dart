import 'package:flutter/material.dart';

import '../../cores/methods.dart';
import '../../cores/widgets/image_item.dart';

class CreateBottomSheet extends StatelessWidget {
  const CreateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFFFFFF),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 15),
        child: SizedBox(
          height: 275,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Create',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),

              //--------------------------------------------------------------------

              const SizedBox(height: 0),
              SizedBox(
                height: 40,
                child: ImageItem(
                  itemText: 'Create a Short',
                  itemClicked: () async {},
                  imageName: 'short-video.png',
                  haveColor: true,
                ),
              ),

              //--------------------------------------------------------------------

              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ImageItem(
                  itemText: 'Upload a Video',
                  itemClicked: () async {
                    await pickVideo();
                  },
                  imageName: 'upload.png',
                  haveColor: true,
                ),
              ),

              //--------------------------------------------------------------------

              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ImageItem(
                  itemText: 'Go Live',
                  itemClicked: () {},
                  imageName: 'go-live.png',
                  haveColor: true,
                ),
              ),

              //--------------------------------------------------------------------

              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ImageItem(
                  itemText: 'Create a post',
                  itemClicked: () {},
                  imageName: 'create-post.png',
                  haveColor: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
