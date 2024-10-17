import 'package:flutter/material.dart';

import '../../../../cores/buttons/image_button.dart';
import '../../../../cores/colors.dart';

class MyChannelButtons extends StatelessWidget {
  const MyChannelButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: softBlueGreyBackGround,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Manage Videos',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

          //--------------------------------------------------------------------

          Expanded(
            child: ImageButton(
              onPressed: () {},
              image: 'pen.png',
              haveColor: true,
            ),
          ),

          //--------------------------------------------------------------------

          Expanded(
            child: ImageButton(
              onPressed: () {},
              image: 'time-watched.png',
              haveColor: true,
            ),
          ),
        ],
      ),
    );
  }
}