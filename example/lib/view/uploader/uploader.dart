import 'package:flutter/material.dart';
import 'package:keui/keui.dart';

class UploaderDemo extends StatefulWidget {
  @override
  _UploaderDemoState createState() => _UploaderDemoState();
}

class _UploaderDemoState extends State<UploaderDemo> {
  List lists = [
    'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1141259048,554497535&fm=26&gp=0.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591613424161&di=6a96d5661dd3fc9ca3b6759908bfcb0e&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fblog%2F201311%2F01%2F20131101182415_rQAH3.jpeg',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uploader 文件上传')
      ),
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.black12
        ),
        padding: EdgeInsets.all(10),
        child: Uploader(context,lists,cancel: (value){
          setState(() {
            lists.remove(value);
          });
        }, getImage: (file){
          print(file);
          // 模拟拍照上传返回的图片
          setState(() {
            lists.add('https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1141259048,554497535&fm=26&gp=0.jpg');
          });
        }),
      ),
    );
  }
}