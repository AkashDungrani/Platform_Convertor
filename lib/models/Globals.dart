import 'package:flutter/rendering.dart';
import 'dart:io';

List<Map<String, dynamic>> Contacts = [
  {
    "name": "Thor",
    "des": "Chris Hemsworth",
    "contact": "6353363645",
    "image": "assets/images/thor.jpeg",
    "date": "22/10/2022",
  },
  {
    "name": "Ironman",
    "des": "Tony Starc",
    "contact": "0987654321",
    "image": "assets/images/im.webp",
    "date": "22/10/2022",
  },
  {
    "name": "Captain America",
    "des": "Steve Roggers",
    "contact": "1234567890",
    "image": "assets/images/ca.jpeg",
    "date": "22/10/2022",
  },
  {
    "name": "Spider Man",
    "des": "Peter Parker",
    "contact": "8376428749",
    "image": "assets/images/spider.webp",
    "date": "22/10/2022",
  },
  {
    "name": "Hulk",
    "des": "Robert Bruce Banner",
    "contact": "8376428749",
    "image": "assets/images/hulk.jpeg",
    "date": "22/10/2022",
  },
  {
    "name": "Dr.Strange",
    "des": "Stephen Strange",
    "contact": "8376428749",
    "image": "assets/images/strange.webp",
    "date": "22/10/2022",
  },
  {
    "name": "Black Panther",
    "des": "T'Challa",
    "contact": "8376428749",
    "image": "assets/images/black.webp",
    "date": "22/10/2022",
  },
  {
    "name": "Loki",
    "des": "HiddleStone",
    "contact": "8376428749",
    "image": "assets/images/loki.webp",
    "date": "22/10/2022",
  },
  {
    "name": "Hawkeye",
    "des": "Clint Barton",
    "contact": "8376428749",
    "image": "assets/images/haw.jpeg",
    "date": "22/10/2022",
  },
];
List<Map<String, dynamic>> newcontacts = [];

class Globals {
  static File? image;
  static String? name;
  static String? contact;
  static String? description;
  static bool isios = false;
}
