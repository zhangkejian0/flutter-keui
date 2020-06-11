part of keui;

class Style {
  Color iconColor = Colors.black26;
  Style({this.iconColor});
}

Widget UploaderImage(context,List list,{
  Function cancel,
  @required Function getImage, // 返回图片file
  num crossAxisCount = 3, // 一行显示的个数
  Style style
}){
  
  final ImagePicker _picker = ImagePicker();
  List<Widget> initListWidget(List list) {
    List<Widget> lists = [];

    // _getCameraImage 打开相机拍照
    _getCameraImage(){
      Future<PickedFile> _imageFile =   _picker.getImage(source: ImageSource.camera);
      _imageFile.then((value){
        if(value != null){
          getImage(value);
        }
      });
    }
    // _getGalleryImage  打开相册，选取照片
    _getGalleryImage(){
      Future<PickedFile> _imageFile =   _picker.getImage(source: ImageSource.gallery);
      _imageFile.then((value){
        if(value != null){
          getImage(value);
        }
      });
    }

    // actionSheet 底部弹出框
    Widget actionSheet() {
      return CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text(
              '打开相机拍照',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'PingFangRegular',
              ),
            ),
            onPressed: () {
              // 打开相机拍照
              _getCameraImage();
              // 关闭菜单
              Navigator.of(context).pop();
            },
          ),
          CupertinoActionSheetAction(
            child: const Text(
              '打开相册，选取照片',
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'PingFangRegular',
              ),
            ),
            onPressed: () {
              // 打开相册，选取照片
              _getGalleryImage();
              // 关闭菜单
              Navigator.of(context).pop();
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: new Text(
            '取消',
            style: TextStyle(
              fontSize: 13.0,
              fontFamily: 'PingFangRegular',
              color: const Color(0xFF666666),
            ),
          ),
          onPressed: () {
            // 关闭菜单
            Navigator.of(context).pop();
          },
        ),
      );
    }
    for (var item in list) {
      lists.add(Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Padding(padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // child: Image.asset('images/cat.jpg', fit: BoxFit.cover,),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoViewSimpleScreen(imageProvider:NetworkImage(item),
                      heroTag: 'simple',)));
                    },
                    child: Image.network(item, fit: BoxFit.cover,),
                  )
                ),
              )
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                child: Icon(Icons.cancel,color: style.iconColor,),
                onTap: (){
                  if(cancel != null) cancel(item);
                }
              )
            )
          ],
        )
      ));
    }
    lists.add(Padding(padding: EdgeInsets.all(10),
      child: GestureDetector(
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.black26,
          radius: Radius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(Icons.camera_alt,color: Colors.black38,),
            ),
          ),
        ),
        
        
        onTap: () async {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => actionSheet(),
          ).then((value) {});
        },
      )
    ));
    return lists;
  }

   // 底部弹出菜单actionSheet
  

  return Container(
    child: GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      // childAspectRatio: 2 / 2,
      children: initListWidget(list),
    ),

  );
}