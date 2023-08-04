import 'package:flutter/material.dart';

class sport extends StatefulWidget {
  const sport({super.key});

  @override
  State<sport> createState() => _sportState();
}

class _sportState extends State<sport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('sport'),
      ),
    );
  }
}
