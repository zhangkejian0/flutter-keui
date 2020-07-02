import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keui_example/view/drag/drag.dart';
import 'package:keui_example/view/sliverAppBar/StickySliverPersistentHeaderDemo.dart';
import 'package:keui_example/view/sliverAppBar/sliverAppBar.dart';

import 'view/dialog/dialog.dart';
import 'view/uploader/uploader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('Dialog 弹出框'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DialogDemo()));
                },
            ),
            Divider(height:10.0,indent:0.0,color: Colors.black12,),
            ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('Uploader 文件上传'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UploaderDemo()));
                },
            ),
            ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('拖动'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DraggableDemo()));
                },
            ),
            Divider(height:10.0,indent:0.0,color: Colors.black12,),
            ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('Sliver-sticky'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StickyDemo()));
                },
            ),
            Divider(height:10.0,indent:0.0,color: Colors.black12,),
            ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('sliver-SliverPersistentHeader'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StickySliverPersistentHeaderDemo()));
                },
            ),
            Divider(height:10.0,indent:0.0,color: Colors.black12,),
          ],
        )
    );
  }
}