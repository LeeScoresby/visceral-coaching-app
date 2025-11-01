import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../features/home/screens/home_screen.dart';
import '../features/challenges/screens/challenges_screen.dart';
import '../features/coaching/screens/coaching_sessions_screen.dart';
import '../features/plans/screens/plans_screen.dart';
import '../features/profile/screens/profile_screen.dart';

/// Widget principal que gestiona la navegación entre las 5 pantallas principales
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // Lista de pantallas
  final List<Widget> _screens = const [
    HomeScreen(),
    ChallengesScreen(),
    CoachingSessionsScreen(),
    PlansScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.surfaceSecondary,
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.textPrimary,
          unselectedItemColor: AppColors.textTertiary,
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 10,
            letterSpacing: 1.5,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            fontSize: 10,
            letterSpacing: 1.5,
          ),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 24),
              activeIcon: Icon(Icons.home, size: 24),
              label: 'INICIO',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center_outlined, size: 24),
              activeIcon: Icon(Icons.fitness_center, size: 24),
              label: 'RETOS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.psychology_outlined, size: 24),
              activeIcon: Icon(Icons.psychology, size: 24),
              label: 'COACHING',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined, size: 24),
              activeIcon: Icon(Icons.calendar_today, size: 24),
              label: 'PLANES',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 24),
              activeIcon: Icon(Icons.person, size: 24),
              label: 'PERFIL',
            ),
          ],
        ),
      ),
    );
  }
}
