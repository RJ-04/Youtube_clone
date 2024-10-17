import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cores/screens/loader.dart';
import 'features/auth/pages/login.dart';
import 'features/auth/pages/username.dart';
import 'features/channel/my_channel/pages/settings.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoginPage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          } else {
            return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot2) {
                final user = FirebaseAuth.instance.currentUser;

                if (!snapshot2.hasData || !snapshot2.data!.exists) {
                  return UsernamePage(
                    displayName: user!.displayName!,
                    email: user.email!,
                    profilePic: user.photoURL!,
                  );
                } else if (snapshot2.connectionState ==
                    ConnectionState.waiting) {
                  return const Loader();
                } else {
                  return const MyChannelSettings();
                }
              },
            );
          }
        },
      ),
    );
  }
}
