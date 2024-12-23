import 'package:flutter/material.dart';

class VideoFirstComment extends StatelessWidget {
  const VideoFirstComment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text('Comments', style: TextStyle(fontWeight: FontWeight.w500)),

            //--------------------------------------------------------------------
            SizedBox(width: 5),
            //--------------------------------------------------------------------

            Text('${0}'),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 7.5),
          child: Row(
            children: [
              CircleAvatar(radius: 15, backgroundColor: Colors.grey),

              //--------------------------------------------------------------------
              SizedBox(width: 10),
              //--------------------------------------------------------------------

              SizedBox(
                width: 275,
                child: Text(
                  'First comment on the video',
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
