import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Home page
class HomePage extends StatelessWidget {
  /// Home page constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Text(
              'Choose Questionnaire',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TabButton(
              title: 'AGRO',
              onTap: () => context.push('/agro-form'),
            ),
            const SizedBox(
              height: 20,
            ),
            const TabButton(title: 'HEALTH'),
            const SizedBox(
              height: 20,
            ),
            const TabButton(title: 'TRANSPORT'),
          ],
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
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
