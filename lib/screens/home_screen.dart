import 'package:flutter/material.dart';

import 'package:hamon_interviewapi/screens/class_rooms.dart';
import 'package:hamon_interviewapi/screens/students.dart';
import 'package:hamon_interviewapi/screens/subjects.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, }) : super(key: key);

 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;
  late PageController _pageController;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabPages = [
      const Students(),
      const Subjects(),
      const ClassRooms(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hamon interview app'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Students"),
          BottomNavigationBarItem(icon: Icon(Icons.subject), label: "Subjects"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Class Rooms"),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
