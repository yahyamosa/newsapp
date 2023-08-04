import 'package:flutter/material.dart';
import 'package:newsapp/Futuer/home/data/model/newsapi/newsapi.dart';

class show_news extends StatefulWidget {
   show_news({required this.news,required this.index ,  super.key});
  Newsapi news ;
  int index ;
  @override
  State<show_news> createState() => _show_newsState();
}

class _show_newsState extends State<show_news> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 28),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(0) ,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("${widget.news.articles![widget.index].urlToImage}")
                    )
                ),
                width: MediaQuery.of(context).size.width,
                height: 280,


              ) ,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30 , left: 5 , right: 5),
                    child: IconButton(onPressed:(){
                      Navigator.pop(context);
                    }, icon:Icon(Icons.arrow_back , color: Colors.white,)),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.only(top: 30 , left: 5 , right: 5),
                    child: IconButton(onPressed:(){
                    
                    }, icon:Icon(Icons.favorite_border, color: Colors.white,)),
                  ) ,

                ],
              ) ,
              Container(
                width: 200,
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height /3.5 , left: 10),
                child: Text('${widget.news.articles![widget.index].title}' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18),overflow: TextOverflow.ellipsis,),
              ),
            ],
          ) ,
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.email_outlined) ,
                    SizedBox(width: 30,),
                    Icon(Icons.share) ,
                    SizedBox(width: 30,),
                    Icon(Icons.file_copy_outlined) ,
                  ],
                ) ,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                 // color: Colors.grey,
                  child: Row(
                    children: [
                      Text('${widget.news.totalResults}') ,
                      SizedBox(width: 5,),
                      Text("comment" , style: TextStyle(fontSize: 10),)
                    ],
                  ),
                )
              ],
            ),
          ) ,
          Padding(
            padding: const EdgeInsets.all(12),
            child: Expanded(child:Text("${widget.news.articles![widget.index].description}" , style: TextStyle(fontSize: 20 , color: Colors.black),)),
          ) ,


        ],
      ),
    );
  }
}
