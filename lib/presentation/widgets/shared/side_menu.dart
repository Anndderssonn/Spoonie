import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spoonie/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> homeScaffoldKey;

  const SideMenu({super.key, required this.homeScaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (index) {
        setState(() => navDrawerIndex = index);
        final menuItem = appMenuItems[index];
        context.push(menuItem.link);
        widget.homeScaffoldKey.currentState?.closeDrawer();
      },
      backgroundColor: colors.surface,
      indicatorColor: colors.secondaryContainer.withAlpha((0.3 * 255).toInt()),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      surfaceTintColor: Colors.transparent,
      children: [
        const _CustomHeaderSideBar(),
        const Divider(),
        const SizedBox(height: 12),
        ...appMenuItems.map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon, color: colors.secondary),
            selectedIcon: Icon(item.icon, color: colors.onSecondaryContainer),
            label: Text(
              item.title,
              style: TextStyle(color: colors.onSecondaryContainer),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Divider(),
        Align(
          alignment: Alignment.bottomLeft,
          child: const _CustomProfileSideBar(),
        ),
      ],
    );
  }
}

class _CustomProfileSideBar extends StatelessWidget {
  const _CustomProfileSideBar();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: colors.secondaryContainer,
            radius: 20,
            child: Icon(Icons.person, color: colors.onSecondaryContainer),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Chef User',
              overflow: TextOverflow.ellipsis,
              style: textStyles.bodyMedium?.copyWith(color: colors.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomHeaderSideBar extends StatelessWidget {
  const _CustomHeaderSideBar();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      child: Row(
        children: [
          Icon(Icons.menu_book_rounded, color: colors.secondary, size: 28),
          const SizedBox(width: 12),
          Text(
            'Spoonie',
            style: textStyles.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
