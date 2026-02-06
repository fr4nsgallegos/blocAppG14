import 'package:blocappg14/features/login/bloc/auth_bloc.dart';
import 'package:blocappg14/features/login/bloc/auth_event.dart';
import 'package:blocappg14/features/login/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text("Login Bloc")),
          body: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Login exitoso"),
                      backgroundColor: Colors.greenAccent,
                    ),
                  );
                  // Aqui navegamos al home
                }
                if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                final isLoading = state is AuthLoading;

                return Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    SizedBox(height: 24),
                    TextField(
                      controller: _passController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                context.read<AuthBloc>().add(
                                  LoginBubmitted(
                                    email: _emailController.text,
                                    password: _passController.text,
                                  ),
                                );
                              },
                        child: isLoading
                            ? SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(),
                              )
                            : Text("Ingresar"),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
