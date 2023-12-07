library jmethods;

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class JMethods {
  static String fileName(String path) {
    String ff = path.replaceAll("\\", "/");
    return ff.substring(ff.lastIndexOf("/") + 1);
  }

  static String fileExtension(String path) {
    String ff = fileName(path);
    return ff.substring(ff.lastIndexOf('.') + 1);
  }

  static String randomString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  static String uniqueId() {
    final randomSt = randomString(7);
    final date = DateTime.now().millisecondsSinceEpoch.toString();
    final key = UniqueKey().toString() + date + randomSt;
    return stringToBase64(key);
  }

  static String stringToBase64(String str) => base64.encode(utf8.encode(str));
  static String base64ToString(String b64) => utf8.decode(base64.decode(b64));
  static String unit8ToString(Uint8List lis) => String.fromCharCodes(lis);
  static Uint8List stringToUnit8(String s) => Uint8List.fromList(s.codeUnits);
  static String stringListToBase64(List<String> list) =>
      stringToBase64(json.encode(list));
  static List<String> base64ToStringList(String data) {
    List<String> fII = [];
    if (data.isNotEmpty) {
      List<dynamic> list = json.decode(base64ToString(data));
      for (var i in list) {
        fII.add(i);
      }
    }
    return fII;
  }

  static String jsonToBase64(Map data) => stringToBase64(json.encode(data));
  static Map<String, dynamic> base64ToJson(String data) =>
      json.decode(base64ToString(data));
  static String jsonToString(Map<String, dynamic> data) => json.encode(data);
  static Map<String, dynamic> stringToJson(String data) => json.decode(data);
  static List<int> dynamicListToIntList(List d) {
    List<int> bb = [];
    for (var i in d) {
      bb.add(i);
    }
    return bb;
  }

  static List<String> dynamicListToStringList(var d) {
    List<String> bb = [];
    for (var i in d) {
      bb.add(i.toString());
    }
    return bb;
  }
}
extension RemoveDuplicate<T> on List<T>{
  List<T> get removedDuplicate =>[
    ...{...this}
  ];
}