import 'package:flutter/material.dart';
import './transparent_image.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fade in images';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Stack(
          children: <Widget>[
            new Center(child: new CircularProgressIndicator()),
            new Center(
              child: new FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    'https://github.com/Davelmk/Images/blob/master/image/20.jpg?raw=true',
              ),
            ),
          ],
        ),
        /* body: new Center(
          child: new CachedNetworkImage(
            placeholder: new CircularProgressIndicator(),
            imageUrl:
                'https://github.com/Davelmk/Images/blob/master/image/20.jpg?raw=true',
          ),
        ), */
      ),
    );
  }
}