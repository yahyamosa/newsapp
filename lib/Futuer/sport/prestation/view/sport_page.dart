import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Futuer/home/data/cubit/mycubit.dart';
import 'package:newsapp/Futuer/home/data/cubit/satae.dart';
import 'package:newsapp/Futuer/home/data/model/newsapi/newsapi.dart';

class sport extends StatefulWidget {
  const sport({super.key});

  @override
  State<sport> createState() => _sportState();
}

class _sportState extends State<sport> {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<mycubit , state>(
        builder:(context, state){
          Newsapi newseg = BlocProvider.of<mycubit>(context).newseg;
         List<Newsapi> myapi = BlocProvider.of<mycubit>(context).myeg;
           BlocProvider.of<mycubit>(context).geteg();
      return Scaffold(
          body:Column(
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 30 , right: 20),
                  child: Text('مصري اليوم ' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),)) ,
              Expanded(
                child: ListView.builder(
                    itemCount:myapi[0].articles!.length,
                    itemBuilder:(context , index){
                      return Column(
                        children: [
                          Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 30 , right: 20),
                              child:  Text('${myapi[0].articles?[index].author}' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),)) ,
                          SizedBox(height: 8,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width,
                            //color: Colors.blue,
                            child: Text("${myapi[0].articles?[index].title}"),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 1,
                            color: Colors.black,
                          )
                        ],
                      );
                    }),
              )
            ],
          )
      );
    }, listener:(context ,state){});

  }
}
