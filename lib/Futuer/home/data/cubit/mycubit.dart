import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Futuer/home/data/cubit/satae.dart';
import 'package:http/http.dart' as http;
import '../model/newsapi/newsapi.dart';

class mycubit extends Cubit<state>{
  mycubit(this.mydata) : super(init()) ;

  Newsapi mydata ;

  List<Newsapi> mylist = [];

  Future<Newsapi> getData()async{
    emit(lod());
    http.Response response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=dbddeef57b58421aafd6a26534fd9d8d'));
    Map<String , dynamic> data = jsonDecode(response.body);
  //  print(data);

     mydata = Newsapi.fromJson(data);
     mylist.add(mydata);
   // print(mydata);
    emit(secsse());

    return mydata;

  }





}