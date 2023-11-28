
import 'package:anti_fb/ui/homepage/peoplepage/people_page.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_tab_bar.dart';
import 'homepage/home_page.dart';
import 'menupage/menu_page.dart';
import 'notificationpage/notification_page.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with TickerProviderStateMixin {


  late PageController pageController;
  late TabController tabController;
  int _selectedIndex = 0;

  late String coin = '';
  late String email = '';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    pageController = PageController();
  }


  @override
  void dispose() {
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }

  final List<IconData> _icons = [
    Icons.home,
    MdiIcons.accountCircleOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  _onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.addListener(() {
      tabController.animateTo(pageController.page!.round());
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = [
      HomePage(email: email, coin: coin),
      const PeoplePage(),
      const NotificationPage(),
      const MenuPage(),
      // const PersonalPage(),
    ];

    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          body: PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: screens,
          ),
          bottomNavigationBar: CustomTabBar(
            controller: tabController,
            icons:_icons,
            onTap: _onTapped,
            selectedIndex: _selectedIndex,
          ),
        ),
    );
  }


}
