import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:tabbar/models/Globals.dart';
import 'package:tabbar/views/components/calls.dart';
import 'package:tabbar/views/components/chats.dart';
import 'package:tabbar/views/components/settings.dart';
import 'package:tabbar/views/components/my_drawer.dart';
import 'package:tabbar/views/components/stepper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  PageController pagecontroller = PageController();
  int currentpage = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  int initialpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: MyDrawer()),
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: false,
        actions: [
          Switch(
              value: Globals.isios,
              onChanged: (val) {
                setState(() {
                  Globals.isios = val;
                });
              })
        ],
        bottom: TabBar(
          indicatorWeight: 3,
          indicatorColor: Colors.white,
          onTap: (val) {
            setState(() {
              currentpage = val;
            });
            pagecontroller.animateToPage(val,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          },
          controller: tabController,
          tabs: [
            Tab(
              child: Text("Chat"),
              // icon: Icon(Icons.chat),
            ),
            Tab(
              child: Text("Calls"),
              // icon: Icon(Icons.call),
            ),
            Tab(
              child: Text("Settings"),
              // icon: Icon(Icons.settings),
            ),
            // Tab(
            //   child: Text("Stepper"),
            //   icon: Icon(Icons.settings),
            // )
          ],
        ),
      ),
      body: PageView(
        controller: pagecontroller,
        onPageChanged: (val) {
          setState(() {
            currentpage = val;
          });
          tabController.animateTo(val);
        },
        children: [
          Chats(),
          Calls(),
          Settings(),
          // MyStepper()
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      // currentIndex: currentpage,
      // onTap: (val) {
      //   setState(() {
      //     currentpage = val;
      //   });
      //   tabController.animateTo(val);
      //   pagecontroller.animateToPage(val,
      //       duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      // },
      // items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
      //   BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.settings), label: "Settings"),
      //   // BottomNavigationBarItem(
      //   //     icon: Icon(Icons.settings), label: "Stepper"),
      // ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      actions: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            child: Text("Cancel")),
                        ElevatedButton(
                            onPressed: () {
                              log("Add button pressed...");

                              setState(() {
                                log("setstate...");

                                // if (Globals.name != null &&
                                //     Globals.contact != null &&
                                //     Globals.description != null) {
                                //   log("if condition true...");
                                newcontacts.add({
                                  "name": Globals.name,
                                  "des": Globals.description,
                                  "contact": Globals.contact,
                                  "image": Globals.image,
                                  "date": "22/10/2022",
                                });
                                log("contact added...");
                                log("$newcontacts");
                                Navigator.of(context).pop;
                                print(newcontacts);
                              });
                            },
                            child: Text("Add")),
                      ],
                      content: Container(
                        height: 300,
                        width: 300,
                        child: MyStepper(),
                      ),
                    ));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
