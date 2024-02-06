import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_demo/bloc/auth_bloc.dart';
import 'package:todo_bloc_demo/home.dart';
import 'package:todo_bloc_demo/login.dart';
import 'package:todo_bloc_demo/pallette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Pallete.backgroundColor,
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const Login(),
          '/home': (_) => const Home()
        },
      ),
    );
  }
}
