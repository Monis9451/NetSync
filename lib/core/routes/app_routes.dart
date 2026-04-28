import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/admin/screens/admin_dashboard.dart';
import 'package:flutter_application_1/features/admin/screens/billing_overview.dart';
import 'package:flutter_application_1/features/admin/screens/package_manager.dart';
import 'package:flutter_application_1/features/admin/screens/user_list_screen.dart';
import 'package:flutter_application_1/features/auth/screens/login_screen.dart';
import 'package:flutter_application_1/features/collector/screens/collector_dashboard.dart';
import 'package:flutter_application_1/features/collector/screens/my_users_collector.dart';
import 'package:flutter_application_1/features/auth/screens/splash_screen.dart';
import 'package:flutter_application_1/features/user_portal/screens/bill_history_screen.dart';
import 'package:flutter_application_1/features/user_portal/screens/notifications_screen.dart';
import 'package:flutter_application_1/features/user_portal/screens/user_home_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String adminDashboard = '/admin-dashboard';
  static const String adminUsers = '/admin-users';
  static const String adminPackages = '/admin-packages';
  static const String adminBilling = '/admin-billing';
  static const String collectorDashboard = '/collector-dashboard';
  static const String collectorUsers = '/collector-users';
  static const String userHome = '/user-home';
  static const String userBills = '/user-bills';
  static const String userAlerts = '/user-alerts';
  static const String splash = '/splash';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );
      case adminDashboard:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AdminDashboard(),
        );
      case adminUsers:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const UserListScreen(),
        );
      case adminPackages:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PackageManagerScreen(),
        );
      case adminBilling:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const BillingOverviewScreen(),
        );
      case collectorDashboard:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CollectorDashboard(),
        );
      case collectorUsers:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyUsersCollector(),
        );
      case userHome:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const UserHomeScreen(),
        );
      case userBills:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const BillHistoryScreen(),
        );
      case userAlerts:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NotificationsScreen(),
        );
      case splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const _UnknownRouteScreen(),
        );
    }
  }
}

class _UnknownRouteScreen extends StatelessWidget {
  const _UnknownRouteScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Route not found')));
  }
}
