import 'package:first/screens/about_us.dart';
import 'package:first/screens/add_breakfast.dart';
import 'package:first/screens/add_dinner.dart';
//import 'package:first/screens/addlunch.dart';
import 'package:first/screens/contact.dart';
import 'package:first/screens/login_screen.dart';
import 'package:first/screens/meal_breakfast_history.dart';
import 'package:first/screens/meal_dinner_history.dart';
import 'package:first/screens/meal_lunch_history.dart';
import 'package:first/screens/settings.dart';
import 'package:first/screens/update.dart';
import 'package:first/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:first/services/auth.dart';
import 'package:first/routes.dart';

import '../models/UserModel.dart';

class Mealhistory extends StatefulWidget {

  final GetUserDetails responseObject;
  const Mealhistory({super.key, required this.responseObject});

  @override
  State<Mealhistory> createState() => _MealhistoryState();
}

class _MealhistoryState extends State<Mealhistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: <Widget>[
          // IconButton(
          //     icon:
          //         const Icon(Icons.notifications_active, color: Colors.black54),
          //     onPressed: () {}),
          IconButton(
            icon: Image.asset('assets/images/Male.png', width: 35, height: 35),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => UserProfile()),
              // );
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Row(
                  children: [
                    IconButton(
                        icon: Image.asset('assets/images/Male.png',
                            width: 75, height: 75),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => UserProfile()),
                          // );
                        }),
                    const Text(
                      'User Name',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Check For Updates'),
              leading: const Icon(Icons.system_update_alt_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Update()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () async {
                await AuthServices().signOut(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/suggest.png'),
                  fit: BoxFit.fill,
                ),
              ),
              width: 240,
              height: 300,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Color.fromARGB(255, 211, 236, 217),
              ),
              child: Center(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: <Widget>[
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BreakfastHistory(uid: widget.responseObject.userid,)),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/picture1.png',
                                fit: BoxFit.cover,
                                height: 80,
                                width: 100,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    'Breakfast',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Explore the History',
                                    style: TextStyle(
                                      color: Color.fromARGB(200, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LunchHistory(uid: widget.responseObject.userid,)),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/picture2.png',
                                fit: BoxFit.cover,
                                height: 80,
                                width: 100,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    'Lunch',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Explore the History',
                                    style: TextStyle(
                                      color: Color.fromARGB(200, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DinnerHistory(uid: widget.responseObject.userid,)),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/picture3.png',
                                fit: BoxFit.cover,
                                height: 80,
                                width: 100,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    'Dinner',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Explore the History',
                                    style: TextStyle(
                                      color: Color.fromARGB(200, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
