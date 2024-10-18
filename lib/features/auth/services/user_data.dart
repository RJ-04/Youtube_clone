import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

final userDataServiceProvider = Provider((ref) => UserDataService(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ));

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;

  UserDataService({required this.auth, required this.firestore});

  addUserDataToFirestore({
    required String displayName,
    required String username,
    required String email,
    required String profilePic,
    required dynamic description,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      profilePic: profilePic,
      subscriptions: [],
      videos: 0,
      userId: auth.currentUser!.uid,
      description: description,
      type: 'user ',
    );

    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(user.toMap());
  }

  Future<UserModel> fetchCurrentUserData() async {
    final currentUserMap =
        await firestore.collection('users').doc(auth.currentUser!.uid).get();

    UserModel user = UserModel.fromMap(currentUserMap.data()!);

    return user;
  }

  Future<bool> validateUserDataUniqueness(
      String userDataElement, String field) async {
    final usersMap = await FirebaseFirestore.instance.collection('users').get();

    final usernameList =
        usersMap.docs.map((users) => users.data()[field]).toList();

    if (usernameList.any((element) => userDataElement == element)) {
      return false;
    } else {
      return true;
    }
  }
}
