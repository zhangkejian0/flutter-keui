part of keui;
class PainterLiquidlevel extends CustomPainter {
  int value; // 液位值 （0-100）
  int maxThreshold; // 预警线范围最大值 （0-100）
  int minThreshold; // 预警线范围最小值 （0-100）
  bool auto; //液位颜色是否自适应
  PainterLiquidlevel({this.value = 80, this.maxThreshold = 85, this.minThreshold = 20,this.auto = false});
  @override
  void paint(Canvas canvas, Size size) {
    Color yellow = Color.fromARGB(100, 255, 157, 0);
    Color red = Colors.red;
    Color color = Color.fromARGB(100, 84, 166, 255);
    if(value > maxThreshold && auto) color = yellow;
    if(value < minThreshold && auto) color = red;
    // 定义蓝色画笔
    Paint _paint0 = Paint()
    ..color = Colors.blue
    ..strokeWidth = 1;
    // 定义黑色画笔
    Paint _paint1 = Paint()
    ..color = Colors.black
    ..strokeWidth = 1;
    // 5个一组 绘制最右侧刻度线
    for(int i = 0;i < 5; i++){
      canvas.drawLine(Offset(size.width * 0.75, size.height * 0.2 * i), Offset(size.width, size.height * 0.2 * i), _paint0);
      canvas.drawLine(Offset(size.width * 0.75, size.height * 0.2 * i + size.height * 0.05), Offset(size.width * 0.9, size.height * 0.2 * i + size.height * 0.05), _paint1);
      canvas.drawLine(Offset(size.width * 0.75, size.height * 0.2 * i + size.height * 0.1), Offset(size.width * 0.95, size.height * 0.2 * i + size.height * 0.1), _paint0);
      canvas.drawLine(Offset(size.width * 0.75, size.height * 0.2 * i + size.height * 0.15), Offset(size.width * 0.9, size.height * 0.2 * i + size.height * 0.15), _paint1);
      canvas.drawLine(Offset(size.width * 0.75, size.height * 0.2 * i + size.height * 0.2), Offset(size.width * 0.95, size.height * 0.2 * i + size.height * 0.2), _paint0);
    }
    // 绘制液位试管
    Paint _paint3 = Paint()
    ..color = Color.fromARGB(100, 214, 234, 255);
    Rect rect = Rect.fromPoints(Offset(50, 0),Offset(70, 200));
    //根据上面的矩形,构建一个圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(10.0));
    canvas.drawRRect(rrect, _paint3);


    // 绘制液位
    Paint _paint4 = Paint()
    ..color = color;
    //根据上面的矩形,构建一个圆角矩形
    RRect rrect1 = RRect.fromLTRBAndCorners(size.width * 0.5, size.height, size.width * 0.7, size.height * (1- value / 100), bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0));
    canvas.drawRRect(rrect1, _paint4);


    // 绘制左侧的警戒矩形

    // 浅黄色矩形
    Paint _paint5 = Paint()
    ..color = Color.fromARGB(100, 255, 184, 92);
    Rect rect2 = Rect.fromPoints(Offset(0, 0), Offset(size.width * 0.4, size.height * (1- maxThreshold / 100)));
    canvas.drawRect(rect2, _paint5);

    // 浅绿色矩形
    Paint _paint6 = Paint()
    ..color = Color.fromARGB(100, 93, 234, 145);
    Rect rect3 = Rect.fromPoints(Offset(0, size.height * (1- maxThreshold / 100)), Offset(size.width * 0.4, size.height * (1- minThreshold / 100) ));
    canvas.drawRect(rect3, _paint6);

    // 浅红色矩形
    Paint _paint7 = Paint()
    ..color = Color.fromARGB(100, 255, 214, 214);
    Rect rect4 = Rect.fromPoints(Offset(0, size.height * (1- minThreshold / 100) ), Offset(size.width * 0.4, size.height));
    canvas.drawRect(rect4, _paint7);

    // 黄色矩形
    Paint _paint8 = Paint()
    ..color = Color.fromARGB(100, 184, 92, 1);
    Rect rect5 = Rect.fromPoints(Offset(size.width * 0.3, 0), Offset(size.width * 0.35, size.height * (1- maxThreshold / 100)));
    canvas.drawRect(rect5, _paint8);

    // 绿色矩形
    Paint _paint9 = Paint()
    ..color = Color.fromARGB(100, 93, 234, 145);
    Rect rect6 = Rect.fromPoints(Offset(size.width * 0.3, size.height * (1- maxThreshold / 100)), Offset(size.width * 0.35, size.height * (1- minThreshold / 100) ));
    canvas.drawRect(rect6, _paint9);

    // 红色矩形
    Paint _paint10 = Paint()
    ..color = Color.fromARGB(100, 255, 83, 83);
    Rect rect7 = Rect.fromPoints(Offset(size.width * 0.3, size.height * (1- minThreshold / 100) ), Offset(size.width * 0.35, size.height));
    canvas.drawRect(rect7, _paint10);

    // 黑色的警戒刻度线
    canvas.drawLine(Offset(0, size.height * (1- maxThreshold / 100)), Offset(size.width * 0.4,size.height * (1- maxThreshold / 100)), _paint1);
    canvas.drawLine(Offset(0, size.height * (1- minThreshold / 100)), Offset(size.width * 0.4,size.height * (1- minThreshold / 100)), _paint1);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}