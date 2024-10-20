import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';
import '../services/user_data.dart';

final currentUserProvider = FutureProvider<UserModel>((ref) async {
  final UserModel user =
      await ref.watch(userDataServiceProvider).fetchCurrentUserData();

  return user;
});
