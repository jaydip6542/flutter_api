import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Postapidemo extends StatefulWidget {
 int postId;
 Postapidemo({ Key key,this.postId }) : super(key: key);
  @override
  _PostapidemoState createState() => _PostapidemoState();
}

class _PostapidemoState extends State<Postapidemo> {
  List user = [];
  List username = [];


  getapi() async{
    var response = await http.get('https://reqres.in/api/users?page='+ (widget.postId).toString() );
    final name = json.decode(response.body);
    // print(name);
    return name;
  }

  @override
  void initState() {
    getapi().then((name){
      setState(() {
        user=name['data'];
         print(user);
        // username = name['data'];
        // print(username);
      });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: user.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: null,
              child: Container(

                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 5,),
                            child: Text(user[index]['first_name'],
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,

                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 5,),
                            child: Text(user[index]['last_name'],
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 5,),
                            child: Text(user[index]['email'],
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],


                      ) ,

                    )

                  ],

                ),


              ),



            );

          }


      ),




    );
  }
}
