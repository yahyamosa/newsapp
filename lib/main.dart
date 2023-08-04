import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Futuer/home/data/cubit/mycubit.dart';
import 'package:newsapp/Futuer/home/data/model/newsapi/newsapi.dart';
import 'package:newsapp/Futuer/home/prestioaion/view/home.dart';
import 'package:newsapp/Futuer/splash/prestaion/view/splash.dart';

void main() {
  runApp(const newsapp());
}
class newsapp extends StatefulWidget {
  const newsapp({super.key});

  @override
  State<newsapp> createState() => _newsappState();
}

class _newsappState extends State<newsapp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>mycubit(Newsapi()))
        ],
        child:MaterialApp(
          debugShowCheckedModeBanner: false,
          home:splash(),
        ));
  }
}
