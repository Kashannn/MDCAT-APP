import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/subject.dart';

import 'LearningMaterial.dart';
import 'homepage.dart';
import 'login.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _pageController = PageController(initialPage: 0);

  final _controller = NotchBottomBarController(index: 0);

  final List<Widget> bottomBarPages = [
    MyHomePage(),
    Subject(),
    LearningMaterial(),
  ];
  var index = 0;

  @override
  void initState() {
    index= 0;
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Future Doctor',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Login');
            },
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.login),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue, Colors.green],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AnimatedNotchBottomBar(

          /// Provide NotchBottomBarController
          notchBottomBarController: _controller,
          color: Colors.white,
          showLabel: false,
          notchColor: Colors.green,

          /// restart app if you change removeMargins
          removeMargins: false,
          bottomBarWidth: 500,
          durationInMilliSeconds: 300,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home,
                color: Colors.green,
              ),
              activeItem: Icon(
                Icons.home_filled,
                color: Colors.white,
              ),
              itemLabel: 'Home Page',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.subject,
                color: Colors.green,
              ),
              activeItem: Icon(
                Icons.subject_sharp,
                color: Colors.white,
              ),
              itemLabel: 'Subject',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.book_outlined,
                color: Colors.green,
              ),
              activeItem: Icon(
                Icons.book,
                color: Colors.white,
              ),
              itemLabel: 'Material',
            ),
          ],
          onTap: (int value) {
            print('Selected Index: $value');
            setState(() {
              index = value;
            });
            // _pageController.jumpToPage(value);
          },
        ),
        extendBody: true,
        body: index == 0
            ? MyHomePage()
            : index == 1
            ? Subject()
            :MyHomePage(),



    );
  }
}
