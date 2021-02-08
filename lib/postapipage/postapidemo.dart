import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Postapipagedemo extends StatefulWidget {

  Postapipagedemo({ Key key,}) : super(key: key);
  @override
  _PostapipagedemoState createState() => _PostapipagedemoState();
}

class _PostapipagedemoState extends State<Postapipagedemo> {
  List user = [];
  List username = [];


  getapi() async{
    var response = await http.post('https://jsonplaceholder.typicode.com/posts');
    final name = json.decode(response.body);
     print(name);
    return name;
  }

  @override
  void initState() {
    getapi().then((name){
      setState(() {
        user=name;
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
                            child: Text(user[index]['title'],
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,

                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 5,),
                            child: Text(user[index]['title'],
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 5,),
                            child: Text(user[index]['title'],
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
