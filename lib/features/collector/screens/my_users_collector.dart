import 'package:flutter/material.dart';
import '../../../core/routes/app_routes.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/portal_drawer.dart';
import 'mark_paid_screen.dart'; // Next screen ka import

class MyUsersCollector extends StatefulWidget {
  const MyUsersCollector({super.key});

  @override
  State<MyUsersCollector> createState() => _MyUsersCollectorState();
}

class _MyUsersCollectorState extends State<MyUsersCollector> {
  int _currentIndex = 1; // 1 means 'My Users' tab is active
  int _selectedFilter = 0; // 0: ALL, 1: PENDING, 2: DUE

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
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const PortalDrawer(portalTitle: 'Collector Portal'),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Users'),
            Text(
              '20 assigned today',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: const Icon(Icons.search),
                fillColor: theme.colorScheme.surface,
              ),
            ),
          ),

          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildFilterChip('ALL (20)', 0, theme),
                const SizedBox(width: 8),
                _buildFilterChip('PENDING (12)', 1, theme),
                const SizedBox(width: 8),
                _buildFilterChip('DUE (08)', 2, theme),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Users List
          Expanded(
            child: ListView(
              children: [
                _buildCollectorUserTile(
                  name: 'Tariq Mehmood',
                  address: 'House 42, St 5',
                  amount: 'Rs. 500',
                  status: 'DUE',
                  statusColor: Colors.orangeAccent,
                  theme: theme,
                  context: context,
                ),
                Divider(
                  color: theme.colorScheme.secondary.withAlpha(50),
                  height: 1,
                ),
                _buildCollectorUserTile(
                  name: 'Noman',
                  address: 'Shop 12, Main Market',
                  amount: 'Rs. 500',
                  status: 'PAID',
                  statusColor: Colors.green,
                  theme: theme,
                  context: context,
                ),
                Divider(
                  color: theme.colorScheme.secondary.withAlpha(50),
                  height: 1,
                ),
                _buildCollectorUserTile(
                  name: 'Saad Ahmed',
                  address: 'House 8, Area A',
                  amount: 'Rs. 1,000',
                  status: 'OVERDUE',
                  statusColor: Colors.redAccent,
                  theme: theme,
                  context: context,
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
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'My Users'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, int index, ThemeData theme) {
    final isSelected = _selectedFilter == index;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() => _selectedFilter = index);
      },
      selectedColor: theme.colorScheme.primary.withAlpha(50),
      labelStyle: TextStyle(
        color: isSelected
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildCollectorUserTile({
    required String name,
    required String address,
    required String amount,
    required String status,
    required Color statusColor,
    required ThemeData theme,
    required BuildContext context,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: () {
        // Navigate to Mark as Paid screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MarkPaidScreen()),
        );
      },
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary.withAlpha(25),
        child: Text(
          name[0],
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        address,
        style: TextStyle(color: theme.colorScheme.secondary),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            amount,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: statusColor.withAlpha(25),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: statusColor),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
