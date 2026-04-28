import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/portal_drawer.dart';
import '../../../shared/widgets/user_list_tile.dart';
import 'add_user_screen.dart'; // Nayi screen ka import

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  int _currentIndex = 1; // 1 means 'Users' tab is active
  int _selectedFilter = 0; // 0: ALL, 1: PAID, 2: PENDING, 3: OVERDUE

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
        routeName = AppRoutes.adminUsers;
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
            const Text('Users'),
            Text(
              '700 total',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, size: 28),
            onPressed: () {
              // Add User Screen par navigate karein
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddUserScreen()),
              );
            },
            color: theme.colorScheme.primary,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search name, phone, area...',
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
                _buildFilterChip('ALL', 0, theme),
                const SizedBox(width: 8),
                _buildFilterChip('PAID', 1, theme),
                const SizedBox(width: 8),
                _buildFilterChip('PENDING', 2, theme),
                const SizedBox(width: 8),
                _buildFilterChip('OVERDUE', 3, theme),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Users List
          Expanded(
            child: ListView(
              children: [
                UserListTile(
                  name: 'Tariq Mehmood',
                  subtitle: 'Area A • 6 Mbps',
                  trailingText: 'PAID',
                  trailingColor: Colors.green,
                ),
                const Divider(height: 1),
                UserListTile(
                  name: 'Ali Khan',
                  subtitle: 'Area B • 10 Mbps',
                  trailingText: 'DUE',
                  trailingColor: Colors.orangeAccent,
                ),
                const Divider(height: 1),
                UserListTile(
                  name: 'Saad Ahmed',
                  subtitle: 'Area A • 4 Mbps',
                  trailingText: 'OVERDUE',
                  trailingColor: Colors.redAccent,
                ),
                const Divider(height: 1),
                UserListTile(
                  name: 'Noman',
                  subtitle: 'Area C • 6 Mbps',
                  trailingText: 'PAID',
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

  Widget _buildFilterChip(String label, int index, ThemeData theme) {
    final isSelected = _selectedFilter == index;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          _selectedFilter = index;
        });
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
}
