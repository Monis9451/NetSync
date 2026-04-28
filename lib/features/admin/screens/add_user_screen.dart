import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_button.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  // Dropdown ke liye variables
  String _selectedArea = 'Area A';
  String _selectedPackage = '6 Mbps Basic';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New User'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Account Info Section
          _buildSectionHeader('ACCOUNT INFO', theme),
          const TextField(
            decoration: InputDecoration(hintText: 'Username'),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(hintText: 'Full Name'),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(hintText: 'Phone Number'),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 32),

          // Location Section
          _buildSectionHeader('LOCATION', theme),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedArea,
                  decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18)),
                  items: ['Area A', 'Area B', 'Area C'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() => _selectedArea = newValue!);
                  },
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: 'Sub-Area'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(hintText: 'Full Address'),
          ),
          const SizedBox(height: 32),

          // Package & Billing Section
          _buildSectionHeader('PACKAGE & BILLING', theme),
          DropdownButtonFormField<String>(
            value: _selectedPackage,
            decoration: const InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18)),
            items: ['4 Mbps Economy', '6 Mbps Basic', '10 Mbps Plus'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() => _selectedPackage = newValue!);
            },
          ),
          const SizedBox(height: 40),

          // Action Buttons
          CustomButton(
            text: 'Save User',
            onPressed: () {
              // Save logic will go here
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Cancel',
            isOutlined: true,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.secondary,
          letterSpacing: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}