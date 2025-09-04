import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task1/bloc/auth_bloc.dart';
import 'package:task1/pages/home_page.dart';
import 'package:task1/pages/login_page.dart';
import 'package:task1/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", builder: (context, state) => LoginPage()),

    GoRoute(path: "/register", builder: (context, state) => RegisterPage()),
    GoRoute(path: "/home", builder: (context, state) => HomePage()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
      ),
    );
  }
}
