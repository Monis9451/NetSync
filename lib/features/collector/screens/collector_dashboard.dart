import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../shared/widgets/stat_card.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/portal_drawer.dart';
import '../../../shared/widgets/user_list_tile.dart';

class CollectorDashboard extends StatefulWidget {
  const CollectorDashboard({super.key});

  @override
  State<CollectorDashboard> createState() => _CollectorDashboardState();
}

class _CollectorDashboardState extends State<CollectorDashboard> {
  int _currentIndex = 0; // 0 means 'Home' tab is active

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;

    String routeName;
    switch (index) {
      case 0:
        routeName = AppRoutes.collectorDashboard;
        break;
      case 1:
        routeName = AppRoutes.collectorUsers;
        break;
      default:
        return;
    }

    // Routing logic implemented
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const PortalDrawer(portalTitle: 'Collector Portal'),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Asif Khan',
              style: theme.textTheme.titleLarge?.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 4),
            Text(
              'Collector • Area A',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Chip(
              label: const Text('Online'),
              backgroundColor: theme.colorScheme.primary.withAlpha(25),
              labelStyle: TextStyle(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              side: BorderSide.none,
              avatar: Icon(
                Icons.circle,
                color: theme.colorScheme.primary,
                size: 12,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Target Progress Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TODAY\'S COLLECTION TARGET',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rs. 15,000',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: 0.33, // 33% collected
                    backgroundColor: theme.colorScheme.secondary.withAlpha(50),
                    color: theme.colorScheme.primary,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Collected: Rs. 5,000  •  Remaining: Rs. 10,000',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Next Users to Visit Section Title
          Text(
            'NEXT USERS TO VISIT',
            style: theme.textTheme.titleMedium?.copyWith(letterSpacing: 1.2),
          ),
          const SizedBox(height: 12),

          // Users Queue List
          Card(
            child: Column(
              children: [
                UserListTile(
                  name: 'Tariq Mehmood',
                  subtitle: 'House 42, St 5, Area A',
                  trailingText: 'Rs. 500',
                  trailingColor: theme.colorScheme.onSurface,
                ),
                Divider(
                  color: theme.colorScheme.secondary.withAlpha(50),
                  height: 1,
                ),
                UserListTile(
                  name: 'Saad Ahmed',
                  subtitle: 'Shop 12, Main Market',
                  trailingText: 'Rs. 1,000',
                  trailingColor: theme.colorScheme.onSurface,
                ),
                Divider(
                  color: theme.colorScheme.secondary.withAlpha(50),
                  height: 1,
                ),
                UserListTile(
                  name: 'Ali Khan',
                  subtitle: 'House 8, St 2, Area A',
                  trailingText: 'Rs. 450',
                  trailingColor: theme.colorScheme.onSurface,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Recently Collected Section Title
          Text(
            'RECENTLY COLLECTED',
            style: theme.textTheme.titleMedium?.copyWith(letterSpacing: 1.2),
          ),
          const SizedBox(height: 12),

          // Recently Collected List
          Card(
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primary.withAlpha(25),
                    child: Icon(Icons.check, color: theme.colorScheme.primary),
                  ),
                  title: const Text('Noman'),
                  subtitle: Text(
                    'Paid at 10:45 AM',
                    style: TextStyle(color: theme.colorScheme.secondary),
                  ),
                  trailing: const Text(
                    'Rs. 500',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80), // Extra space for FAB
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        onPressed: () {
          // Future: Navigate to 'Mark as Paid' or 'Scan User QR' screen
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'My Users'),
        ],
      ),
    );
  }
}
