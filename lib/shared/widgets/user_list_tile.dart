import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  final String name;
  final String? subtitle;
  final String? trailingText;
  final Color? trailingColor;
  final VoidCallback? onTap;

  const UserListTile({
    super.key,
    required this.name,
    this.subtitle,
    this.trailingText,
    this.trailingColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : '?',
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        name,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
              ),
            )
          : null,
      trailing: trailingText != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: trailingColor?.withOpacity(0.1) ??
                    theme.colorScheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: trailingColor ?? theme.colorScheme.secondary,
                  width: 1,
                ),
              ),
              child: Text(
                trailingText!,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: trailingColor ?? theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : const Icon(Icons.chevron_right),
    );
  }
}