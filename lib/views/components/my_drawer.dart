import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          color: Colors.blue,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 60,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Akash Dungrani"),
                Text("+91 6353363645"),
              ]),
        ),
        flex: 3,
      ),
      Expanded(
          flex: 7,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.home),
                      SizedBox(
                      width: 30,
                    ),
                    Text("Home",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Divider(thickness: 1,color: Colors.blueGrey,),
                Row(
                  children: [
                    Icon(Icons.chat_bubble),
                      SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Chats",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.blueGrey,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 30,
                    ),
                    Text("Settings",
                    style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ))
    ]);
  }
}
