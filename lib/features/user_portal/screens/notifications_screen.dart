import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/portal_drawer.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _currentIndex = 2;

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;
    String routeName;
    switch (index) {
      case 0:
        routeName = AppRoutes.userHome;
        break;
      case 1:
        routeName = AppRoutes.userBills;
        break;
      case 2:
        routeName = AppRoutes.userAlerts;
        break;
      default:
        return;
    }
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const PortalDrawer(portalTitle: 'User Portal'),
      appBar: AppBar(title: const Text('Alerts & Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAlertCard(
            title: 'Scheduled Maintenance',
            message:
                'Internet services will be down for 2 hours tonight from 2 AM to 4 AM due to fiber upgrades in Area A.',
            date: 'Just now',
            icon: Icons.warning_amber_rounded,
            iconColor: Colors.orangeAccent,
            theme: theme,
          ),
          const SizedBox(height: 16),
          _buildAlertCard(
            title: 'Bill Generated',
            message:
                'Your bill for April 2026 has been generated. Kindly pay before the 10th to avoid late fees.',
            date: '2 days ago',
            icon: Icons.receipt_long,
            iconColor: theme.colorScheme.primary,
            theme: theme,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Bills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard({
    required String title,
    required String message,
    required String date,
    required IconData icon,
    required Color iconColor,
    required ThemeData theme,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: iconColor.withAlpha(25),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        date,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: TextStyle(color: theme.colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
