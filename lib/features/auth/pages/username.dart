import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cores/buttons/flat_button.dart';
import '../services/user_data.dart';

final _formKey = GlobalKey<FormState>();

class UsernamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String profilePic;
  final String email;

  const UsernamePage({
    required this.displayName,
    required this.email,
    required this.profilePic,
    super.key,
  });

  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends ConsumerState<UsernamePage> {
  final TextEditingController _usernameController = TextEditingController();
  bool isValidate = true;

  void validateUsername() async {
    final usersMap = await FirebaseFirestore.instance.collection('users').get();

    final usernameList =
        usersMap.docs.map((users) => users.data()['username']).toList();

    if (usernameList.any((element) => _usernameController.text == element)) {
      setState(() {
        isValidate = false;
      });
    } else {
      setState(() {
        isValidate = true;
      });
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: Text(
                'Enter the Username',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),

            //--------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                child: TextFormField(
                  onChanged: (username) => validateUsername(),
                  key: _formKey,
                  controller: _usernameController,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (username) =>
                      isValidate ? null : 'username already taken',
                  decoration: InputDecoration(
                    hintText: 'Jane Doe',
                    suffixIcon: isValidate
                        ? const Icon(Icons.verified_user_rounded)
                        : const Icon(Icons.cancel_rounded),
                    suffixIconColor: isValidate ? Colors.green : Colors.red,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),

            //--------------------------------------------------------------------

            const Spacer(),

            //--------------------------------------------------------------------

            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
              child: FlatButton(
                text: 'CONTINUE',
                onPressed: () async {
                  isValidate
                      ? await ref
                          .read(userDataServiceProvider)
                          .addUserDataToFirestore(
                            displayName: widget.displayName,
                            username: _usernameController.text,
                            email: widget.email,
                            profilePic: widget.profilePic,
                            description: '',
                          )
                      : null;
                },
                colour: isValidate ? Colors.green : Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
