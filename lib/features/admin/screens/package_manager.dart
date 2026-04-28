import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/portal_drawer.dart';

class PackageManagerScreen extends StatefulWidget {
  const PackageManagerScreen({super.key});

  @override
  State<PackageManagerScreen> createState() => _PackageManagerScreenState();
}

class _PackageManagerScreenState extends State<PackageManagerScreen> {
  int _currentIndex = 2; // 2 means 'Packages' tab is active

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
        routeName = AppRoutes.adminPackages;
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
            const Text('Packages'),
            Text(
              '4 active packages',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, size: 28),
            onPressed: () {},
            color: theme.colorScheme.primary,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Info Card
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.secondary.withAlpha(50),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lock_outline,
                  color: theme.colorScheme.secondary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Buy rates hidden from collectors. Only admins see profit.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Package Card 1
          _buildPackageCard(
            theme,
            title: '6 Mbps Basic',
            subscribers: '340 subscribers',
            buyRate: 'Rs. 2,000',
            sellRate: 'Rs. 2,500',
            profit: 'Rs. 500',
          ),
          const SizedBox(height: 16),

          // Package Card 2
          _buildPackageCard(
            theme,
            title: '10 Mbps Plus',
            subscribers: '195 subscribers',
            buyRate: 'Rs. 3,000',
            sellRate: 'Rs. 3,800',
            profit: 'Rs. 800',
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

  Widget _buildPackageCard(
    ThemeData theme, {
    required String title,
    required String subscribers,
    required String buyRate,
    required String sellRate,
    required String profit,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleLarge),
                    Text(
                      subscribers,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                Chip(
                  label: const Text('ACTIVE'),
                  backgroundColor: theme.colorScheme.primary.withAlpha(25),
                  labelStyle: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  side: BorderSide.none,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRateColumn('BUY RATE', buyRate, theme),
                _buildRateColumn('SELL RATE', sellRate, theme),
                _buildRateColumn('PROFIT', profit, theme, isProfit: true),
              ],
            ),
            const SizedBox(height: 20),
            Divider(color: theme.colorScheme.secondary.withAlpha(50)),
            const SizedBox(height: 8),
            Text(
              'AREA DISCOUNTS',
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.secondary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Area A'),
                Text('Rs. 450', style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Area B'),
                Text('Rs. 500', style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, size: 16),
                    label: const Text('Edit'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 16),
                    label: const Text('Discount'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRateColumn(
    String label,
    String amount,
    ThemeData theme, {
    bool isProfit = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.secondary,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isProfit
                ? theme.colorScheme.primary.withAlpha(25)
                : theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isProfit
                  ? theme.colorScheme.primary
                  : theme.colorScheme.secondary.withAlpha(50),
            ),
          ),
          child: Text(
            amount,
            style: TextStyle(
              color: isProfit
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
