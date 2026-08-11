import 'package:ensayo/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (i) => navigationShell.goBranch(i),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home), label: t.nav.home),
          NavigationDestination(
            icon: const Icon(Icons.calendar_month),
            label: t.nav.plan,
          ),
          NavigationDestination(
            icon: const Icon(Icons.note_alt),
            label: t.nav.session,
          ),
          NavigationDestination(
            icon: const Icon(Icons.auto_graph),
            label: t.nav.progress,
          ),
        ],
      ),
    );
  }
}
