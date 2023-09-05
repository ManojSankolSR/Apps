import 'package:flutter/material.dart';
import 'package:ostello/HomeScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kColor = Color.fromRGBO(138, 43, 226, 1);

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
