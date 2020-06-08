import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keui/keui.dart';
class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialogDemo')
      ),
      body: Padding(padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('提示弹框'),
            Row(
              children: <Widget>[
                Container(
                  child: MaterialButton(
                    child: Text('提示弹框', style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
                    onPressed: (){
                      DialogWidget(
                        context,
                        title: '提示',
                        message: 'message',
                        confirmCallback:(){

                        }
                      );
                    }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left:10),
                  child: MaterialButton(
                    child: Text('提示弹框(无标题)', style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
                    onPressed: (){
                      DialogWidget(
                        context,
                        message: 'message',
                        confirmCallback:(){
                          
                        }
                      );
                    }
                  )
                )
              ],
            ),
            Text('确认弹框'),
            Container(
              child: MaterialButton(
                child: Text('确认弹框', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  DialogWidget(
                    context,
                    title: '提示',
                    message: 'message',
                    confirmCallback:(){
                      
                    },
                    cancelCallback:(){
                      
                    }
                  );
                }
              )
            ),
            Text('自定义widget'),
            Container(
              child: MaterialButton(
                child: Text('确认弹框', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  DialogWidget(
                    context,
                    title: '提示',
                    widget: Image.asset('images/cat.jpg'),
                    confirmCallback:(){
                      
                    },
                    cancelCallback:(){
                      
                    }
                  );
                }
              )
            )
          ],
        ),
      )
    );
  }
}