import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tales/books_screen.dart';
import 'package:tales/explore_screen.dart';
import 'package:tales/home_screen.dart';
import 'package:tales/minies_screen.dart';
import 'package:tales/profile_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  PageController? _pageController;
  int _currentPageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    _pageController!.addListener(() {
      setState(() {
        _currentPageIndex = _pageController!.page!.round();
      });
    });
  }

  List<Widget> _screens = [
    HomeScreen(),
    ExploreScreen(),
    BooksScreen(),
    MiniesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) {
              return _screens[index];
            },
            itemCount: _screens.length,
          ),
          Positioned(
              bottom: 16,
              left: 30,
              right: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(150),
                ),
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomBarButton(
                        icon: IconlyLight.home,
                        onTapCallback: () {
                          _pageController!.jumpToPage(0);
                        },
                        isSelected: _currentPageIndex == 0,
                        label: 'Home',
                        color: Colors.deepPurple.shade100),
                    BottomBarButton(
                        icon: IconlyLight.search,
                        onTapCallback: () {
                          _pageController!.jumpToPage(1);
                        },
                        isSelected: _currentPageIndex == 1,
                        label: 'Explore',
                        color: Colors.deepPurple.shade100),
                    BottomBarButton(
                        icon: IconlyLight.paper,
                        onTapCallback: () {
                          _pageController!.jumpToPage(2);
                        },
                        isSelected: _currentPageIndex == 2,
                        label: 'Books',
                        color: Colors.deepPurple.shade100),
                    BottomBarButton(
                        icon: IconlyLight.play,
                        onTapCallback: () {
                          _pageController!.jumpToPage(3);
                        },
                        isSelected: _currentPageIndex == 3,
                        label: 'Minies',
                        color: Colors.deepPurple.shade100),
                    BottomBarButton(
                        icon: IconlyLight.profile,
                        onTapCallback: () {
                          _pageController!.jumpToPage(4);
                        },
                        isSelected: _currentPageIndex == 4,
                        label: 'You',
                        color: Colors.deepPurple.shade100),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  IconData icon;
  final Function() onTapCallback;
  final bool isSelected;
  final String label;
  final Color color;
  BottomBarButton(
      {super.key,
      required this.icon,
      required this.onTapCallback,
      required this.isSelected,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onTapCallback,
        color: isSelected ? color : Colors.grey,
      ),
    );
  }
}
