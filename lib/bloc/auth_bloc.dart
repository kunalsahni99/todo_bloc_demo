import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      //email and pass validation

      try {
        if (event.pass.length < 6) {
          return emit(AuthFailure('Password is too short'));
        }

        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthSuccess('$event.email-$event.pass'));
        });
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
}
