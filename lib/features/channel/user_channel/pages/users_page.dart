import 'package:flutter/material.dart';

import '../../../../cores/widgets/flat_button.dart';

class UsersChannel extends StatelessWidget {
  const UsersChannel({super.key});

  @override
  Widget build(BuildContext context) {
    bool haveVideos = false;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/flutter background.png',
              fit: BoxFit.cover,
            ),

            //--------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                children: [
                  const CircleAvatar(radius: 40, backgroundColor: Colors.grey),

                  //--------------------------------------------------------------------

                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'RJ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        //--------------------------------------------------------------------

                        const Text(
                          'username',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey,
                          ),
                        ),

                        //--------------------------------------------------------------------

                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey,
                            ),
                            children: [
                              TextSpan(text: 'No subs    '),
                              TextSpan(text: 'No vid    '),
                            ],
                          ),
                        ),

                        //--------------------------------------------------------------------
                      ],
                    ),
                  ),

                  //--------------------------------------------------------------------
                ],
              ),
            ),

            //--------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: FlatButton(
                text: 'SUBSCRIBE',
                onPressed: () {},
                colour: Colors.black87,
              ),
            ),

            //--------------------------------------------------------------------

            haveVideos
                ? const SizedBox()
                : const Expanded(
                    child: Center(
                      child: Text(
                        'No Video',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
