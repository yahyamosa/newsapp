import 'package:flutter/material.dart';

class cont extends StatefulWidget {
  const cont({super.key});

  @override
  State<cont> createState() => _contState();
}

class _contState extends State<cont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'cont'
        ),
      ),
    );
  }
}
