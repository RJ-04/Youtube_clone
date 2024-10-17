import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../auth/model/user_model.dart';

class Header extends StatelessWidget {
  final UserModel user;
  const Header({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(user.profilePic),
          ),
        ),

        //--------------------------------------------------------------------

        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            user.displayName,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),

        //--------------------------------------------------------------------

        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.blueGrey),
              children: [
                TextSpan(text: user.username),
                TextSpan(
                    text: '      ${user.subscriptions.length} subscriptions'),
                TextSpan(text: '      ${user.videos} videos'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
