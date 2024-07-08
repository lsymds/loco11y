import "package:flutter/material.dart";
import "package:loco11y/shared/ui/theme/app_colors.dart";

class SidebarNavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const SidebarNavigationItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.sidebarForeground,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.sidebarForeground,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
