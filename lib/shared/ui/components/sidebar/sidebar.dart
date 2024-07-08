import "package:flutter/material.dart";
import "package:loco11y/shared/ui/components/sidebar/sidebar_navigation_item.dart";
import "package:loco11y/shared/ui/theme/app_colors.dart";

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: AppColors.sidebarBackgound),
      child: Column(
        children: [
          SidebarNavigationItem(
            icon: Icons.webhook,
            label: "HTTP",
            onPressed: () {},
          ),
          Expanded(child: Container()),
          SidebarNavigationItem(
            icon: Icons.help,
            label: "Help",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
