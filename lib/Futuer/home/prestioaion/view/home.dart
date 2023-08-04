import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Futuer/currencies/prestaion/view/currencies_page.dart';
import 'package:newsapp/Futuer/helt/prestaion/view/helt_page.dart';
import 'package:newsapp/Futuer/home/data/cubit/mycubit.dart';
import 'package:newsapp/Futuer/home/data/cubit/satae.dart';
import 'package:newsapp/Futuer/home/prestioaion/view/show_news.dart';
import 'package:newsapp/Futuer/sport/prestation/view/sport_page.dart';

import '../../data/model/newsapi/newsapi.dart';

class homenews extends StatefulWidget {
  const homenews({super.key});

  @override
  State<homenews> createState() => _homenewsState();
}

List<String> tabbar = [
  'HOME' ,
  'SPORT' ,
  'currencies' ,
  'the health'
];
int index = 0 ;

class _homenewsState extends State<homenews> {
  @override
  void initState() {
    BlocProvider.of<mycubit>(context).getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<mycubit , state>(
        builder:(context , state){

          Newsapi mydata = BlocProvider.of<mycubit>(context).mydata;
          List<Newsapi> mylist = BlocProvider.of<mycubit>(context).mylist;
      return Scaffold(
        body:state is lod ? const Center(child: CircularProgressIndicator()) :
        Column(
          children: [
           Container(
             height: 100,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: tabbar.length,
                 itemBuilder:(context , indext){
               return  GestureDetector(
                 onTap: (){
                   index = indext ;
                   setState(() {

                   });
                   if(indext == 1){
                     Navigator.push(context,MaterialPageRoute(builder:(context)=>sport()));
                     setState(() {
                       index = 0 ;
                     });
                   }else if (indext == 2){
                     Navigator.push(context,MaterialPageRoute(builder:(context)=>cont()));
                     setState(() {
                       index = 0 ;
                     });
                   }else if (indext == 3){
                     Navigator.push(context, MaterialPageRoute(builder:(context)=>helt()));
                     setState(() {
                       index = 0 ;
                     });
                   }

                 },
                 child:index == indext ? Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     alignment: Alignment.center,
                     margin: EdgeInsets.only(top: 40, bottom: 10),
                     width: 110,
                     height: 40,
                     decoration: BoxDecoration(
                       color: Colors.black,
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: Text('${tabbar[indext]}' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                   ),
                 ) :  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     alignment: Alignment.center,
                     margin: EdgeInsets.only(top: 40, bottom: 10),
                     width: 110,
                     height: 40,
                     decoration: BoxDecoration(
                       color: Colors.grey,
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: Text('${tabbar[indext]}' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
                   ),
                 ),
               ) ;
             }),
           ) ,

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: mylist[0].articles!.length,
                  itemBuilder:(context , indext){
                return GestureDetector(
                  onTap: (){
                    Newsapi news = Newsapi(articles:mylist[0].articles , status: mylist[0].status , totalResults: mylist[0].totalResults);
                    Navigator.push(context,MaterialPageRoute(builder:(context)=>show_news(news:news , index: indext,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8) ,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("${mylist[0].articles![indext].urlToImage}"),
                              )

                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text('${mylist[0].articles![indext].title}' , overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),),
                          width: 300,
                        ),
                        SizedBox(height: 12,),
                        Container(
                          child: Text("${mylist[0].articles![indext].description}" ,),
                          height: 100,

                        ),
                        Container(
                          width: 270,
                          height: 1,
                          color: Colors.black,
                        ) ,

                      ],
                    )
                  ),
                ) ;
              }),
            )
          ],
        ),
      );
    }, listener:(context , state){});
  }
}



