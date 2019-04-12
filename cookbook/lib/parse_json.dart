import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});
  //解析JSON节点
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Isolate",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Isolate Demo"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        //snapshot:返回结果
        builder: (context,snapshot){
          if(snapshot.hasError){
            print(snapshot.error);
          }
          return snapshot.hasData 
                  ? PhotosList(photos:snapshot.data)
                  : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;
  PhotosList({Key key,@required this.photos}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemCount: photos.length,
      itemBuilder: (context,index){
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}

List<Photo> parsePhoto(String responseBody){
  final parsed=json.decode(responseBody).cast<Map<String,dynamic>>();
  return parsed.map<Photo>((json)=>Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async{
  final response=await client.get("https://jsonplaceholder.typicode.com/photos");
  // return parsePhotos(response.body);
  //compute:后台单独的线程解析JSON
  return compute(parsePhoto,response.body);
}