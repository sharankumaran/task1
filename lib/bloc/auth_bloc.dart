import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/bloc/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Map<String, String> _registerusers = {};
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onlogin);
    on<AuthRegisterRequest>(_onregister);
  }
  void _onlogin(AuthLoginRequested event, Emitter<AuthState> emit) async {
    await Future.delayed(Duration(seconds: 1));
    final email = event.email.trim();
    final password = event.password.trim();

    //check if user is registered
    if (!_registerusers.containsKey(email)) {
      emit(AuthFailure('user not found'));
      return;
    }

    //check password matches
    if (_registerusers[email] != password) {
      emit(AuthFailure('invalide password'));
      return;
    }

    //loginsuccesfull
    emit(AuthSuccess(user: UserModel(name: email.split('@')[0], email: email)));

    if (email == "saran@gmail.com" && password == "password") {
      emit(AuthSuccess(user: UserModel(name: "saran", email: event.email)));
    }
    if (password.length < 6) {
      return emit(AuthFailure('Password cannot be lessthan 6 Characters'));
    }
  }

  void _onregister(AuthRegisterRequest event, Emitter<AuthState> emit) async {
    await Future.delayed(Duration(seconds: 1));

    final email = event.email.trim();
    final password = event.password.trim();

    //check if email already exits
    if (_registerusers.containsKey(email)) {
      emit(AuthFailure('email already registered'));
      return;
    }

    //save new user
    _registerusers[email] = password;
    emit(AuthSuccess(user: UserModel(name: event.name, email: event.email)));
  }
}
