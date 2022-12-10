import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_page_provider.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationView();
}

class _BottomNavigationView extends State<BottomNavigationView> {
  int _selectedIndex = 0;
  late HomePageProvider _provider;

  void _onItemTapped(int index) {
    _provider.currentPage = index;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _provider = context.read();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: IconWidget(asset: 'assets/images/ic_form.png'),
                  activeIcon: IconWidget(asset: 'assets/images/ic_form.png', color: Theme.of(context).primaryColor),
                label: 'Forms'
              ),
              BottomNavigationBarItem(
                  icon: IconWidget(asset: 'assets/images/ic_draft.png'),
                  activeIcon: IconWidget(asset: 'assets/images/ic_draft.png', color: Theme.of(context).primaryColor),
                label: 'Drafts'
              ),
              BottomNavigationBarItem(
                  icon: IconWidget(asset: 'assets/images/ic_tick.png'),
                activeIcon: IconWidget(asset: 'assets/images/ic_tick.png', color: Theme.of(context).primaryColor),
                label: 'Submission'
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              _provider.currentPage = index;
              setState(() {
                _selectedIndex = index;
              });
            },
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  Color? color;
  String asset;

  IconWidget({
    Key? key,  required this.asset, this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        color: color ??= Colors.black.withOpacity(0.64),
        height: 24,
        width: 24,
        child: Image.asset(asset),
      ),
    );
  }
}

