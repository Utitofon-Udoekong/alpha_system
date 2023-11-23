import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Home page
class HomePage extends StatelessWidget {
  /// Home page constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose Sector',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              TabButton(
                title: 'Agro',
                onTap: () => context.push('/agro-form'),
              ),
              const SizedBox(
                height: 20,
              ),
              TabButton(
                title: 'Health',
                onTap: () => context.push('/health-form'),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const TabButton(title: 'Transport'),
            ],
          ),
        ),
      ),
    );
  }
}

/// TabButton widget
class TabButton extends StatelessWidget {
  /// constructor
  const TabButton({required this.title, super.key, this.onTap});

  /// Title of tab button
  final String title;

  /// function
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.blueGrey.withOpacity(0.3),
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
