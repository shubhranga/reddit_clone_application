import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone_application/core/common/loader.dart';
import 'package:reddit_clone_application/core/common/sign_in_button.dart';
import 'package:reddit_clone_application/core/constants/constants.dart';
import 'package:reddit_clone_application/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone_application/theme/pallete.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

    void signInAsGuest(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).signInAsGuest(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        actions: [
          TextButton(
              onPressed: () => signInAsGuest(ref, context),
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Pallete.blueColor, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: isLoading? const Loader(): Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Drive into anything',
            style: TextStyle(
              fontSize: 24.0,
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Constants.loginEmotePath,
            height: 400,),
          ),
          const SizedBox(height: 20.0,),
          const SignInButton(),
        ],
      ),
    );
  }
}
