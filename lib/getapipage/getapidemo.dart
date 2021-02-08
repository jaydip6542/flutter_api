import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inteviewfacebookdemotest/getapipage/postapipage.dart';

class Getapidemo extends StatefulWidget {
  String postId;

  Getapidemo({ Key key, }) : super(key: key);
  @override
  _GetapidemoState createState() => _GetapidemoState();
}

class _GetapidemoState extends State<Getapidemo> {

  List user = [];
  List username = [];

  getapi() async{
    var response = await http.get('https://reqres.in/api/users?page=1');
    final name = json.decode(response.body);
   // print(name);
    return name;
  }


  @override
  void initState() {
    getapi().then((name){
      setState(() {
         user=name['data'];
        // print(user);
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
                     onTap: () => _navication(context ,user[index]['id']),
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


void _navication(BuildContext context, int id){
  
  Navigator.of(context).push(
  MaterialPageRoute(builder: (contex) => Postapidemo(postId: id)),
  );


}