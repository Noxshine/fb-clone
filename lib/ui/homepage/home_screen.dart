


import 'package:anti_fb/storage.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:anti_fb/widgets/icon/IconMessageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../constants.dart';
import '../../widgets/icon/IconSearchWidget.dart';
import 'home_page.dart';
import 'menu_page.dart';
import 'notification_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // Define the pages or sections you want to navigate to.
  final List<Widget> _pages = [
    const HomePage(),
    const NotificationPage(),
    const MenuPage(),
  ];
  final List<Widget> _title = [
    const Text('Anti fb', style: TextStyle( color: CYAN, fontSize: 20, fontWeight: FontWeight.bold, ),),
    const Text('Notification', style: TextStyle( color: CYAN, fontSize: 20, fontWeight: FontWeight.bold, ),),
    const Text('Menu', style: TextStyle( color: CYAN, fontSize: 20, fontWeight: FontWeight.bold, ),),

  ];

  final List<List<Widget>> _iconList = [
    [ const IconSearchWidget(), const IconMessageWidget(),],
    [ const IconSearchWidget(),],
    [ const IconSearchWidget(),],
  ];
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarVisible = true;
  bool _isBottomBarVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isAppBarVisible = false;
          _isBottomBarVisible = false;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isAppBarVisible = true;
          _isBottomBarVisible = true;
        });
      }
    });

  }
  void _onItemTapped(int index) {
    setState(() { _selectedIndex = index;});
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _isAppBarVisible ? AppBar(
          // floating: true,
          // snap: true,
        backgroundColor: WHITE,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            _title[_selectedIndex],
            Padding(
              padding: const EdgeInsets.only(left: 50), //
              child: Container(
                // padding: const EdgeInsets.only(left: 100),
                width: 100,
                decoration: BoxDecoration(
                  color : GREY,
                  border: Border.all(
                    color: TRANSPARENT,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // child : TextWidget(text: 'Coin : $coin', fontSize: 16, textColor: YELLOW,paddingLeft: 5,)
                child:
                  FutureBuilder<String?>(
                    future: getCoin(), // Replace with your actual future function that fetches the coin value
                    builder: (context, snapshot) {
                      final coin = snapshot.data;
                      return TextWidget(text: 'Coin : $coin', fontSize: 16, textColor: YELLOW,paddingLeft: 5,);
                    }
                  )
              )
            )
          ]
        ),
        actions: _iconList[_selectedIndex],

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Container(
            color: WHITE,
            // padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Container(
                //   width: 20, // Adjust the width as needed
                //   height: 20, // Adjust the height as needed
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage('assets/images/messi-world-cup.png'), // Specify the asset path
                //     ),
                //   ),
                // ),
                Expanded(
                    child: Container(
                    padding: const EdgeInsets.all(5),
                    child:  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: WHITE, // Set the background color to transparent
                        elevation: 0,
                        alignment: AlignmentDirectional.centerStart, // Align the button to the left side of the container
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () { Navigator.pushNamed(context, '/post');},
                      child: const Text(
                        "What's on your mind?",
                        style: TextStyle(
                          color: BLACK,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.image),
                )
              ],
            )
          )
        ),
      ): PreferredSize(
        preferredSize: const Size(0, 0), // Hide the app bar
        child: Container(),
      ),

      body: ListView(
        controller: _scrollController,
        children: [_pages[_selectedIndex],],
      ),


      bottomNavigationBar:  Visibility(
        visible: _isBottomBarVisible,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem( icon: Icon(Icons.home), label: 'Home',),
            BottomNavigationBarItem( icon: Icon(Icons.notifications), label: 'Notifications',),
            BottomNavigationBarItem( icon: Icon(Icons.menu), label: 'Menu',),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: CYAN,
          unselectedItemColor: GREY, // Set unselected icon color to grey
        )
      )
    );
  }


}


