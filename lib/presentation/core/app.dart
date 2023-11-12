import 'package:alpha_system/presentation/authentication/cubit/auth_cubit.dart';
import 'package:alpha_system/presentation/home/cubit/inventory_cubit.dart';
import 'package:alpha_system/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/// App Builder
class AppBuilder extends StatelessWidget {
  /// Widget constructor
  const AppBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => InventoryCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Alpha System',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          textTheme: GoogleFonts.ralewayTextTheme(
            Theme.of(context).textTheme,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   Hive.close();
  //   super.dispose();
  // }
}
