import 'package:blocappg14/features/login/bloc/auth_event.dart';
import 'package:blocappg14/features/login/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginBubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginBubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      // Simulamos la llamada a ala API
      await Future.delayed(Duration(seconds: 2));

      final emailOk = event.email.trim() == "padre@correo.com";
      final passOk = event.password == "123456";

      if (emailOk && passOk) {
        emit(const AuthSuccess("USER01"));
      } else {
        emit(const AuthFailure("Credenciales incorrectas"));
      }
    } catch (e) {
      emit(AuthFailure("Error inesperado: $e"));
    }
  }
}
