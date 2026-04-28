import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import '../../../shared/widgets/stat_card.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/portal_drawer.dart';
import '../../../shared/widgets/user_list_tile.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentIndex = 0;

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
        routeName = AppRoutes.adminDashboard;
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const PortalDrawer(portalTitle: 'Admin Portal'),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning, Usman',
              style: theme.textTheme.titleLarge?.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 4),
            Text(
              'Admin • Area A & B • 700 Users',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              child: Text(
                'UA',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Primary Stat Card (This Month Revenue)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TOTAL COLLECTION THIS MONTH',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.secondary,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rs. 450,000',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: theme
                          .colorScheme
                          .primary, // Mint color for main revenue
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.trending_up,
                        color: theme.colorScheme.primary,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '+12% vs last month',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Grid View for Sub-Stats
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true, // Zaroori hai jab GridView ListView ke andar ho
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.5,
            children: const [
              StatCard(
                title: 'TOTAL USERS',
                value: '700',
                subtitle: 'Active accounts',
              ),
              StatCard(
                title: 'PENDING BILLS',
                value: '145',
                subtitle: 'Unpaid',
              ),
              StatCard(
                title: 'OVERDUE',
                value: '23',
                subtitle: 'Past due date',
              ),
              StatCard(title: 'PACKAGES', value: '4', subtitle: 'Active plans'),
            ],
          ),
          const SizedBox(height: 24),

          // Section Title
          Text(
            'COLLECTION PROGRESS TODAY',
            style: theme.textTheme.titleMedium?.copyWith(letterSpacing: 1.2),
          ),
          const SizedBox(height: 12),

          // Progress List
          Card(
            child: Column(
              children: [
                UserListTile(
                  name: 'Asif Khan',
                  subtitle: 'Target: Rs. 15,000',
                  trailingText: '72%',
                  trailingColor: theme.colorScheme.primary,
                ),
                Divider(
                  color: theme.colorScheme.secondary.withAlpha(50),
                  height: 1,
                ),
                UserListTile(
                  name: 'Nabeel',
                  subtitle: 'Target: Rs. 10,000',
                  trailingText: '45%',
                  trailingColor: Colors.orangeAccent,
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
}
