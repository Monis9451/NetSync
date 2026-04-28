import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/portal_drawer.dart';
import '../../../shared/widgets/user_list_tile.dart';

class BillingOverviewScreen extends StatefulWidget {
  const BillingOverviewScreen({super.key});

  @override
  State<BillingOverviewScreen> createState() => _BillingOverviewScreenState();
}

class _BillingOverviewScreenState extends State<BillingOverviewScreen> {
  int _currentIndex = 3; // 3 means 'Billing' tab is active

  void _onTabTapped(int index) {
    if (index == _currentIndex) return;

    final String routeName;
    switch (index) {
      case 0:
        routeName = AppRoutes.adminDashboard;
        break;
      case 1:
        routeName = AppRoutes.adminUsers;
        break;
      case 2:
        routeName = AppRoutes.adminPackages;
        break;
      case 3:
        routeName = AppRoutes.adminBilling;
        break;
      default:
        routeName = AppRoutes.adminBilling;
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const PortalDrawer(portalTitle: 'Admin Portal'),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Billing'),
            Text(
              'April 2026',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.calendar_today), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Top Grid Stats
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.8,
            children: [
              _buildSmallStatCard('BILLS SENT', '700', theme),
              _buildSmallStatCard(
                'PAID',
                '450',
                theme,
                valueColor: theme.colorScheme.primary,
              ),
              _buildSmallStatCard(
                'PENDING',
                '250',
                theme,
                valueColor: Colors.orangeAccent,
              ),
              _buildSmallStatCard(
                'CARRY FWD',
                'Rs. 15K',
                theme,
                valueColor: Colors.redAccent,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Main Revenue Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THIS MONTH REVENUE',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rs. 450,000',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: 0.65, // 65% collected
                    backgroundColor: theme.colorScheme.secondary.withAlpha(50),
                    color: theme.colorScheme.primary,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '65% of Total Expected (Rs. 690,000)',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Recent Bills Title
          Text(
            'RECENT BILLS',
            style: theme.textTheme.titleMedium?.copyWith(letterSpacing: 1.2),
          ),
          const SizedBox(height: 12),

          // Recent Bills List
          Card(
            child: Column(
              children: [
                UserListTile(
                  name: 'Tariq Mehmood',
                  subtitle: 'Collector: Asif Khan',
                  trailingText: 'Rs. 500',
                  trailingColor: theme.colorScheme.primary, // Paid status color
                ),
                Divider(
                  color: theme.colorScheme.secondary.withAlpha(50),
                  height: 1,
                ),
                UserListTile(
                  name: 'Ali Khan',
                  subtitle: 'Collector: Nabeel',
                  trailingText: 'Rs. 800',
                  trailingColor: Colors.orangeAccent, // Pending status color
                ),
                Divider(
                  color: theme.colorScheme.secondary.withAlpha(50),
                  height: 1,
                ),
                UserListTile(
                  name: 'Saad Ahmed',
                  subtitle: 'Carry Forward Applied',
                  trailingText: 'Rs. 1,200',
                  trailingColor: Colors.redAccent, // Overdue/Carry status color
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Packages',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Billing'),
        ],
      ),
    );
  }

  Widget _buildSmallStatCard(
    String title,
    String value,
    ThemeData theme, {
    Color? valueColor,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.secondary,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: valueColor ?? theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
