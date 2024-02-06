import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_demo/bloc/auth_bloc.dart';
import 'package:todo_bloc_demo/pallette.dart';
import '../widgets/gradient_button.dart';
import '../widgets/login_field.dart';
import '../widgets/social_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (ctx, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.msg)));
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (c, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/pngs/signin_balls.png'),
                  const Text(
                    'Sign in',
                    style: TextStyle(
                        color: Pallete.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),
                  const SizedBox(height: 50),
                  const SocialButton(
                      iconPath: 'assets/svgs/g_logo.svg',
                      label: 'Continue with Google'),
                  const SizedBox(height: 20),
                  const SocialButton(
                    iconPath: 'assets/svgs/f_logo.svg',
                    label: 'Continue with Facebook',
                    horizontalPadding: 90,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 17,
                      color: Pallete.whiteColor
                    ),
                  ),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  LoginField(
                    hintText: 'Password',
                    controller: passController,
                  ),
                  const SizedBox(height: 20),
                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLoginRequested(
                          email: emailController.text.trim(),
                          pass: passController.text.trim()));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
