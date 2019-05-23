import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5.0),
            padding: EdgeInsets.all(6.5),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/im.jpg'),
              radius: 21.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('AM'),
              backgroundColor: Colors.purple,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 250.0,
          width: 330.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
