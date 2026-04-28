import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/portal_drawer.dart';
import '../../../shared/widgets/user_list_tile.dart';

class BillHistoryScreen extends StatefulWidget {
  const BillHistoryScreen({super.key});

  @override
  State<BillHistoryScreen> createState() => _BillHistoryScreenState();
}

class _BillHistoryScreenState extends State<BillHistoryScreen> {
  int _currentIndex = 1;

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
      appBar: AppBar(title: const Text('Bill History')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: Column(
              children: [
                UserListTile(
                  name: 'April 2026',
                  subtitle: 'Paid on 05 Apr, 2026',
                  trailingText: 'Rs. 1,000',
                  trailingColor: Colors.green,
                ),
                Divider(
                  color: theme.colorScheme.secondary.withAlpha(50),
                  height: 1,
                ),
                UserListTile(
                  name: 'March 2026',
                  subtitle: 'Paid on 10 Mar, 2026',
                  trailingText: 'Rs. 1,000',
                  trailingColor: Colors.green,
                ),
                Divider(
                  color: theme.colorScheme.secondary.withAlpha(50),
                  height: 1,
                ),
                UserListTile(
                  name: 'February 2026',
                  subtitle: 'Paid on 08 Feb, 2026',
                  trailingText: 'Rs. 1,000',
                  trailingColor: Colors.green,
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
}
