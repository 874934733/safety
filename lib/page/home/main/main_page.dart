import 'package:auto_size_text/auto_size_text.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

///首页
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ///轮播图
  List<BannerModel> bannerList = [];

  @override
  void initState() {
    super.initState();
    _getHomeBanner();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/icon_home_top_bg.png',
                      width: size.width,
                      fit: BoxFit.fill, // 完全填充
                      height: 200,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(top: 27),
                          child: const AutoSizeText(
                            '首页',
                            minFontSize: 18,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 16, left: 21, right: 21),
                          width: size.width,
                          height: 146,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    bannerList[index].imagePath,
                                    fit: BoxFit.fill,
                                  ));
                            },
                            itemCount: bannerList.length,
                            autoplay: true,
                            pagination: const SwiperPagination(
                                builder: DotSwiperPaginationBuilder(
                                    color: Color(0xFFFFFFFF),
                                    size: 6,
                                    activeColor: Color(0xFFFF4646))),
                            // control: const SwiperControl(),//< >
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
  }

  ///获取轮播图内容
  void _getHomeBanner() async {
    bannerList
        .add(BannerModel(imagePath: 'assets/images/icon_banner.png', id: '1'));
    bannerList
        .add(BannerModel(imagePath: 'assets/images/icon_banner.png', id: '2'));
    bannerList
        .add(BannerModel(imagePath: 'assets/images/icon_banner.png', id: '3'));
    setState(() {});
  }
}
