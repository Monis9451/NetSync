import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../core/routes/app_routes.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Receipt'),
        automaticallyImplyLeading: false, // Receipt screen se back aane ka option hide karne ke liye
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Success Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(25),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle, color: Colors.green, size: 72),
            ),
            const SizedBox(height: 24),

            // Success Message
            Text(
              'Payment Successful!',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Receipt #INV-2026-0491',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.secondary),
            ),
            const SizedBox(height: 40),

            // Receipt Details Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    _buildReceiptRow('User', 'Tariq Mehmood', theme),
                    const SizedBox(height: 16),
                    _buildReceiptRow('Collector', 'Asif Khan', theme),
                    const SizedBox(height: 16),
                    _buildReceiptRow('Date & Time', '27 Apr 2026, 06:15 PM', theme),
                    const SizedBox(height: 16),
                    _buildReceiptRow('Method', 'Cash', theme),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Amount Paid', style: theme.textTheme.titleMedium),
                        Text('Rs. 500', style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),

            // Action Buttons
            CustomButton(
              text: 'Share Receipt',
              icon: Icons.share,
              onPressed: () {
                // PDF generate ya WhatsApp share logic yahan aayegi
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Back to Dashboard',
              isOutlined: true,
              onPressed: () {
                // Seedha Collector Dashboard par wapas le jane ke liye
                Navigator.pushReplacementNamed(context, AppRoutes.collectorDashboard);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.secondary)),
        Text(value, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}