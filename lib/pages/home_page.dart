import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task1/bloc/auth_bloc.dart';
import 'package:task1/bloc/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            final UserModel user = state.user;
            return Padding(
              padding: EdgeInsets.all(90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('welcome,${user.name}'),
                  SizedBox(height: 15),
                  Text("email:${user.email}"),
                  SizedBox(height: 35),
                ],
              ),
            );
          } else if (state is AuthFailure) {
            return Center(child: Text('authentication failed:${state.error}'));
          } else {
            return Center(child: Text('no user data.please login'));
          }
        },
      ),
    );
  }
}
