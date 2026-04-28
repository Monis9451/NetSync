import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/collector/screens/receipt_screen.dart';
import '../../../shared/widgets/custom_button.dart';

class MarkPaidScreen extends StatefulWidget {
  const MarkPaidScreen({super.key});

  @override
  State<MarkPaidScreen> createState() => _MarkPaidScreenState();
}

class _MarkPaidScreenState extends State<MarkPaidScreen> {
  int _selectedMethod = 0; // 0 for Cash, 1 for Online

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mark as Paid'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // User Info Card
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: theme.colorScheme.primary.withAlpha(25),
                child: Text('TM', style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
              title: const Text('Tariq Mehmood', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: const Text('House 42, St 5, Area A\n0300-1234567'),
              isThreeLine: true,
            ),
          ),
          const SizedBox(height: 24),

          // Amount Payable
          Center(
            child: Text(
              'AMOUNT PAYABLE',
              style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary, letterSpacing: 1.5),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Rs. 500',
              style: theme.textTheme.displayMedium?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 40),

          // Payment Method Selection
          Text('PAYMENT METHOD', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary, letterSpacing: 1.2)),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildMethodCard('Cash', Icons.money, 0, theme)),
              const SizedBox(width: 16),
              Expanded(child: _buildMethodCard('Online', Icons.wifi, 1, theme)),
            ],
          ),
          const SizedBox(height: 24),

          // Amount Received Input
          Text('AMOUNT RECEIVED', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary, letterSpacing: 1.2)),
          const SizedBox(height: 8),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'e.g. 500',
              prefixText: 'Rs. ',
            ),
          ),
          const SizedBox(height: 16),

          // Remarks
          Text('REMARKS (OPTIONAL)', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.secondary, letterSpacing: 1.2)),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Add note here...',
            ),
          ),
          const SizedBox(height: 40),

          // Confirm Button
          // Confirm Button
          CustomButton(
            text: '✓ Confirm Payment Received',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ReceiptScreen()),
              );
            },
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              '⚠ This action cannot be undone by collectors.',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodCard(String title, IconData icon, int index, ThemeData theme) {
    final isSelected = _selectedMethod == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary.withAlpha(25) : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.secondary.withAlpha(50),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface, size: 32),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}