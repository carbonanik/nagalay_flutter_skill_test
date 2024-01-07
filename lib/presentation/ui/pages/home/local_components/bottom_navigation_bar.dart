part of '../home_page.dart';

class _BottomNavigationBarItemData {
  final String icon;
  final String label;

  const _BottomNavigationBarItemData({
    required this.icon,
    required this.label,
  });
}

final _navigationItems = [
  _BottomNavigationBarItemData(
    icon: Assets.icons.search,
    label: 'Explore',
  ),
  _BottomNavigationBarItemData(
    icon: Assets.icons.request,
    label: 'Request',
  ),
  _BottomNavigationBarItemData(
    icon: Assets.icons.message,
    label: 'Inbox',
  ),
  _BottomNavigationBarItemData(
    icon: Assets.icons.briefcase,
    label: 'Trips',
  )
];

class _BottomNavigationBar extends StatefulWidget {
  final void Function(int index) onSelect;

  const _BottomNavigationBar({
    required this.onSelect,
  });

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      elevation: 30,
      onTap: (value) {
        selectedIndex = value;
        setState(() {});
        widget.onSelect(value);
      },
      items: List.generate(
        _navigationItems.length,
        (index) => _buildBottomNavigationBarItem(_navigationItems[index]),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    _BottomNavigationBarItemData item,
  ) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        item.icon,
        colorFilter: ColorFilter.mode(
          _itemIconColor(
            context,
            _navigationItems.indexOf(item),
          ),
          BlendMode.srcIn,
        ),
      ),
      label: item.label,
    );
  }

  Color _itemIconColor(BuildContext context, int currentIndex) {
    return currentIndex == selectedIndex
        ? Theme.of(context).colorScheme.inversePrimary
        : Theme.of(context).colorScheme.primary;
  }
}
