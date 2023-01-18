import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tabbar/models/Globals.dart';
import 'package:tabbar/views/components/stepper.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...Contacts.map((e) => GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (context) => Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                                borderRadius: BorderRadius.circular(100),),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // (e["image".runtimeType!= File])?
                                CircleAvatar(
                                  radius: 80,
                                  backgroundColor: Colors.black,
                                  backgroundImage:AssetImage("${e["image"]}") ,
                                  // child: Image.asset("${e["images"]}"),
                                ),
                                // :CircleAvatar(
                                //   radius: 80,
                                //   backgroundColor: Colors.black,
                                //   backgroundImage:FileImage(e["image"]) ,
                                //   // child: Image.asset("${e["images"]}"),
                                // ),
                                Text("${e["name"]}"),
                                Text("${e["contact"]}"),
                              ],
                            ),
                          ));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: 0.0, bottom: 3.0, left: 0.0, right: 0.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.black,
                         backgroundImage: AssetImage("${e["image"]}"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${e["name"]}"),
                          Text("${e["des"]}"),
                        ],
                      ),
                      Spacer(),
                      Text("${e["date"]}"),
                    ],
                  ),
                ),
              )).toList(),
              ...newcontacts.map((e) => Builder(
                builder: (context) {
                  return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => Container(
                                      height: 300,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(100),
                                              topRight: Radius.circular(100))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                              CircleAvatar(
                                                  radius: 80,
                                                  backgroundColor: Colors.black,
                                                  backgroundImage:
                                                      FileImage(e["image"]),
                                                
                                                ),
                                          Text("${e["name"]}"),
                                          Text("${e["contact"]}"),
                                        ],
                                      ),
                                    ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 0.0, bottom: 3.0, left: 0.0, right: 0.0),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.black,
                                  backgroundImage:  FileImage(e["image"]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${e["name"]}"),
                                    Text("${e["des"]}"),
                                  ],
                                ),
                                Spacer(),
                                Text("${e["date"]}"),
                              ],
                            ),
                          ),
                        );
                }
              )).toList(),
              ],
        ),
      ),
    );
  }
}
