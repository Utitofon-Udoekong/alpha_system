import 'package:alpha_system/presentation/authentication/login.dart';
import 'package:alpha_system/presentation/authentication/register.dart';
import 'package:alpha_system/presentation/home/home_page.dart';
import 'package:alpha_system/presentation/onboarding/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
/// GoRouter page configuration
final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
      // redirect: (context, state) => Future.delayed(const Duration(seconds: 1), () => '/login')
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
  debugLogDiagnostics: true,
);
