part of keui;

Future DialogWidget(context, {
      String title, //弹窗标题 默认：提示
      String message, //弹窗文字呢内容 默认：--
      Widget widget,
      String cancelButtonText = '取消', //取消按钮文字 默认：取消
      String confirmButtonText = '确定', //确认按钮文字 默认：确认
      Function cancelCallback, // 取消按钮回调， 如果没有cancelCallback，那么这个按钮不会显示
      Function confirmCallback // 确认按钮回调， 如果没有confirmCallback，那么这个按钮不会显示
}){
  List<Widget> actions = [];
  Widget cancelWiget = CupertinoButton(
    child: Text(cancelButtonText, style:  TextStyle(color: Color.fromRGBO(14, 16, 26, 1)),),
    onPressed: () {
      Navigator.pop(context);
      if (cancelCallback != null) cancelCallback();
    },
  );
  Widget confirmWiget = CupertinoButton(
    child: Text(confirmButtonText, style:  TextStyle(color: Color.fromRGBO(43, 80, 230, 1)),),
    onPressed: () {
      Navigator.pop(context);
      if (confirmCallback != null) confirmCallback();
    },
  );

  if(cancelCallback != null){
    actions.add(cancelWiget);
  }
  if(confirmCallback != null){
    actions.add(confirmWiget);
  }
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Scaffold(
          backgroundColor: Colors.transparent, // 设置透明背影
          body: CupertinoAlertDialog(
            title: title == null ? title : Padding(padding: EdgeInsets.only(bottom: 10), child: Text(title),),
            content: widget != null ? widget : Center(child: Text(defaultValue(message)),),
            actions: actions.toList(),
          ),
        ),
      );
    }
  ).then((value) => value);
}

String defaultValue(String value) {
  if (isEmpty(value)) {
    return '--';
  } else {
    return value;
  }
}

bool isEmpty(String value) {
  if (value == null || value == '') {
    return true;
  } else {
    return false;
  }
}