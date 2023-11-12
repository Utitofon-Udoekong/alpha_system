import 'package:alpha_system/presentation/authentication/cubit/auth_cubit.dart';
import 'package:alpha_system/presentation/widgets/app_button.dart';
import 'package:alpha_system/presentation/widgets/app_snackbar.dart';
import 'package:alpha_system/presentation/widgets/app_text_field.dart';
import 'package:alpha_system/presentation/widgets/hero_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// SIGNUP PAGE
class RegistrationPage extends StatelessWidget {
  /// Constructor
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((AuthCubit bloc) => bloc.state.isLoading);
    final obscureText =
        context.select((AuthCubit bloc) => bloc.state.obscureText);
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.failure != current.failure && current.failure.isNotEmpty,
          listener: (context, state) {
            AppSnackbar.show(context, state.failure, true);
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (p, c) => c.success == 'Registration successful',
          listener: (context, state) {
            context.go('/home');
            context.read<AuthCubit>().reset();
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const HeroImage(),
                  Text(
                    'Register',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    title: 'Username or Email Address',
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    onChanged: (username) =>
                        context.read<AuthCubit>().setUsername(username),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: 'Password',
                    obscureText: obscureText,
                    isPasswordField: true,
                    textInputAction: TextInputAction.done,
                    toggleVisibility: () =>
                        context.read<AuthCubit>().togglePasswordVisibility(),
                    onChanged: (password) =>
                        context.read<AuthCubit>().setPassword(password),
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    title: 'REGISTER',
                    onTap: () => context.read<AuthCubit>().signup(),
                    disabled: isLoading,
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () => context.push('/login'),
                    child: Text(
                      'Already have an account? Sign in',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
