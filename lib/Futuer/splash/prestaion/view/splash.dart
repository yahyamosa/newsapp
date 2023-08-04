import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Futuer/home/data/cubit/mycubit.dart';
import 'package:newsapp/Futuer/home/prestioaion/view/home.dart';

class splash extends StatefulWidget {
   splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    BlocProvider.of<mycubit>(context).getData();
    Timer(const Duration(seconds: 3), ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>homenews())));
    super.initState();
  }
  Widget build(BuildContext context) {
    return new  Scaffold(
      body:const Center(
        child:  Text(
          'News' , style:  TextStyle(fontSize:33 , fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
