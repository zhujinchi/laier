import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/system_info.dart';
import 'package:lecle_flutter_absolute_path/lecle_flutter_absolute_path.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List singlelistData = [
    // {
    //   "title": "记录1",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "content://media/external/images/media/48971",
    // },
    // {
    //   "title": "记录2",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录3",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录4",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录5",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录6",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录7",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录8",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录9",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录10",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录11",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录12",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录13",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录14",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录15",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录16",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录17",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
    // {
    //   "title": "记录18",
    //   "introduction": "拍摄于武汉大学",
    //   "imageUrl":
    //       "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
    // },
  ];

  List multiplelistData = [
    {
      "title": "记录1",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录2",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录3",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录4",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录5",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录6",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录7",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录8",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录9",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录10",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录11",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录12",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录13",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录14",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录15",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录16",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录17",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
    {
      "title": "记录18",
      "introduction": "拍摄于武汉大学",
      "imageUrl":
          "https://cid-inc.com/app/uploads/2020/10/lai_leaf_area_index_canopy.jpg",
    },
  ];
  _getImageInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('imageInfo') != null) {
      var imageInfo = prefs.getString('imageInfo');
      var infoList = imageInfo!.split(';');
      for (var i = 0; i < infoList.length; i++) {
        var path = await LecleFlutterAbsolutePath.getAbsolutePath(
            infoList[i].split('@')[0]);
        singlelistData.add({
          "title": '记录' + (i + 1).toString(),
          "introduction": infoList[i].split('@')[1],
          "imageUrl": path
        });
      }
    } else {
      singlelistData = [
        {
          "title": "test",
          "introduction": "test",
          "imageUrl":
              "https://nwzimg.wezhan.cn/contents/sitefiles2024/10124681/images/6049812.png?",
        }
      ];
    }
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      //点击tab回调一次，滑动切换tab不会回调
      if (_tabController.indexIsChanging) {
        print("ysl--${_tabController.index}");
      }

      //点击tab时或滑动tab回调一次
      if (_tabController.index.toDouble() == _tabController.animation?.value) {
        print("ysl${_tabController.index}");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(390, 844),
    );

    return Scaffold(
        backgroundColor: SystemInfo.shared().backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffffffff),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0.w,
          title: Text(
            '历史',
            style: TextStyle(
                color: SystemInfo.shared().themeColor,
                fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: SystemInfo.shared().themeColor,
            indicatorColor: SystemInfo.shared().themeColor.withOpacity(0.8),
            tabs: const [
              Tab(
                text: "单次",
              ),
              Tab(
                text: "批量处理",
              ),
            ],
          ),
        ),

        //内容区域
        body: TabBarView(
          //必须配置
          controller: _tabController,
          children: [singleList(), multipleList()],
        ));
  }

  Widget singleList() {
    return FutureBuilder(
        future: _getImageInfo(),
        builder: (context, _) {
          return ListView(
              children: singlelistData.map((value) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Image.file(File(value['imageUrl'])),
                  subtitle: Text('lai值：' + getlai()),
                  title: Text('单次拍摄：' + value['title']),
                  selectedColor: Colors.grey,
                  enabled: true,
                  onTap: () {
                    print('123');
                  },
                ),
                const Divider(height: 1, indent: 0.0, color: Colors.grey)
              ],
            );
          }).toList());
        });
  }

  Widget multipleList() {
    return ListView(
        children: multiplelistData.map((value) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: Image.network(value['imageUrl']),
            subtitle: Text('lai值：' + getlai()),
            title: Text('批量拍摄：' + value['title']),
            selectedColor: Colors.grey,
            enabled: true,
            onTap: () {
              print('123');
            },
          ),
          const Divider(height: 1, indent: 0.0, color: Colors.grey)
        ],
      );
    }).toList());
  }

  String getlai() {
    var rng = new Random();
    var temp = rng.nextInt(10000) / 10000;
    return temp.toString();
  }
}
