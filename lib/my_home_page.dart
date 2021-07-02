import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List> getData() async {
    String theUrl = "https://jsonplaceholder.typicode.com/posts";
    var res = await http
        .get(Uri.parse(theUrl), headers: {"Accept": "Application/json"});
    var responseBody = json.decode(res.body);
    print("${responseBody[0]["title"]}");
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HTTP request'),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List snap = snapshot.data;
            ConnectionState connection = snapshot.connectionState;
            if (connection == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(" error : ${snapshot.error}"));
            }

            return ListView.builder(
                itemCount: snap.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text('${snapshot.data[index]["transaction_amount"]}'),
                    subtitle: Text(
                        '${snapshot.data[index]["transaction_Sender_Name"]}'),
                  );
                });
          },
        ));
  }
}
