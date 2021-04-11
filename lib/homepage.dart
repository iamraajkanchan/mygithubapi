import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, @required this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJSONData();
  }

  Future<String> getJSONData() async {
    var response = await http.get(Uri.https('api.github.com', 'users'));
    setState(() {
      var converDataTOJSON = json.decode(response.body);
      data = converDataTOJSON;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: data.length ?? 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index]['avatar_url']),
                  ),
                  title: Text(
                    data[index]['login'],
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    data[index]['url'],
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
