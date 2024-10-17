import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 25),
                child: Image.asset(
                  'assets/images/youtube-signin.jpg',
                  height: 150,
                ),
              ),

              //--------------------------------------------------------------------

              const Text(
                'Welcome to YouTube',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),

              //--------------------------------------------------------------------

              const Spacer(),

              //--------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.only(bottom: 55),
                child: GestureDetector(
                  onTap: () async {
                    await ref.read(authServiceProvider).signInWithGoogle();
                  },
                  child: Image.asset(
                    'assets/images/signinwithgoogle.png',
                    height: 60,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}