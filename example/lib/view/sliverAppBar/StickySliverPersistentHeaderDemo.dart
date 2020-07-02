import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StickySliverPersistentHeaderDemo extends StatefulWidget {
  @override
  _StickySliverPersistentHeaderDemoState createState() =>
      _StickySliverPersistentHeaderDemoState();
}

class _StickySliverPersistentHeaderDemoState
    extends State<StickySliverPersistentHeaderDemo> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int _list = 30;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: () async {
        _refreshController.resetNoData();
        await Future.delayed(Duration(milliseconds: 2000));
        print('onRefresh');
        setState(() {
          _list = 10;
        });
        _refreshController.refreshCompleted();
      },
      onLoading: () async {
        await Future.delayed(Duration(milliseconds: 2000));
        print('onLoading');
        setState(() {
          _list++;
        });
        _refreshController.loadComplete();
      },
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: Colors.pink,
            title: Text('StickySliverPersistentHeaderDemo'),
          ),
          SliverPersistentHeader(
            delegate: DemoHeader(),
            pinned: true,
            floating: true,
          ),
          // SliverFillRemaining(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) {
          //       return ListTile(title: Text(index.toString()),);
          //     },
          //     itemCount: 100,
          //   ),
          // ),
          // CupertinoSliverRefreshControl(
          //   refreshIndicatorExtent: 10,
          //   onRefresh: () async {
          //     print(1);
          //     setState(() {
          //       _list++;
          //     });
          //   },
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text(index.toString()),
                );
              },
              childCount: _list,
            ),
          ),
        ],
      ),
    ));
  }
}

class DemoHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text('我是一个头部部件',
            style: TextStyle(color: Colors.white, fontSize: 30.0)));
  } // 头部展示内容

  @override
  double get maxExtent => 300.0; // 最大高度

  @override
  double get minExtent => 0.0; // 最小高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      true; // 因为所有的内容都是固定的，所以不需要更新
}
