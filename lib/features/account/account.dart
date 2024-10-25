import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../auth/model/user_model.dart';
import 'items.dart';

class AccountPage extends StatelessWidget {
  final UserModel user;
  const AccountPage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(user.profilePic),
              ),

              //--------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  user.displayName,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              //--------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  user.username,
                  style:
                      const TextStyle(fontSize: 12.5, color: Colors.blueGrey),
                ),
              ),

              //--------------------------------------------------------------------

              const Items(),
            ],
          ),
        ),
      ),
    );
  }
}
