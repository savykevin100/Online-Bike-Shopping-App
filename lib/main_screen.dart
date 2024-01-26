import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import 'package:statistique_progress/core/colors.dart';
import 'package:statistique_progress/core/dimensions.dart';
import 'package:statistique_progress/details_screen.dart';
import 'package:statistique_progress/models/product_model.dart';
import 'package:statistique_progress/painters/bottom_item_painter.dart';
import 'package:statistique_progress/painters/container_shape_painter.dart';
import 'package:statistique_progress/painters/product_painter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  int _currentIndexHorizontalList = 0;

  final List<String> _horizontalListImages = [
    "assets/All.svg",
    "assets/bicycle.svg",
    "assets/tab_bar/map.fill.svg",
    "assets/tab_bar/doc.text.fill.svg",

    "assets/tab_bar/map.fill.svg",
    // "assets/bicycle.svg",
    // "assets/tab_bar/doc.text.fill.svg",
    // "assets/bicycle.svg",
    // "assets/tab_bar/doc.text.fill.svg"
  ];
  final List<ProductModel> _imagesPath = [
    ProductModel(
        img: "assets/Electric%20Bicycle.I05 2.png",
        name: "PEUGEOT - LR01 ",
        price: "\$ 1,999.99",
        categoryName: "Road Bike",
        isFavorite: false,
        index: 0),
    ProductModel(
        img: "assets/cobi-krumholz-mZKF19ydEzk-unsplash-removebg-preview 1.png",
        name: "SMITH - Trade ",
        price: "\$ 120",
        categoryName: "Road Helmet",
        isFavorite: true,
        index: 1),
    ProductModel(
        img: "assets/Electric%20Bicycle.I05 2.png",
        name: "PEUGEOT - LR01 ",
        price: "\$ 1,999.99",
        categoryName: "Road Bike",
        isFavorite: true,
        index: 2),
    ProductModel(
        img: "assets/Electric%20Bicycle.I05 2.png",
        name: "PEUGEOT - LR01 ",
        price: "\$ 1,999.99",
        categoryName: "Road Bike",
        isFavorite: false,
        index: 3)
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: ColorsResource.black70,
          body: Container(
              color: ColorsResource.black70,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SvgPicture.asset("assets/Rectangle 474.svg"),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: DimensionsResource.defaultMargin),
                          child: buildTopBar(),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: DimensionsResource.defaultMargin),
                            child: ListView(
                              children: [
                                CustomShapeContainer(),
                                SizedBox(
                                  height: 20,
                                ),
                                _buildHorizontalList(),
                                GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: .55,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: _imagesPath
                                      .map((e) => Padding(
                                            padding: e.index % 2 != 0
                                                ? EdgeInsets.only(bottom: 30)
                                                : EdgeInsets.only(top: 30),
                                            child: _buildProduct(e),
                                          ))
                                      .toList(),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildBotttomNavBar(),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildHorizontalList() {
    return Transform.rotate(
      angle: -math.pi / 30,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              for (int index = 0; index < _horizontalListImages.length; index++)
                InkWell(
                  onTap: () => setState(() {
                    _currentIndexHorizontalList = index;
                  }),
                  child: Transform.rotate(
                    angle: math.pi / 30,
                    child: Container(
                        width: 50,
                        height: _horizontalListImages.length * 10,
                        margin: EdgeInsets.only(right: 30, bottom: index * 3),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: _currentIndexHorizontalList == index
                                    ? ColorsResource.searchGradientColor
                                    : [Color(0xff363E51), Color(0xff191E26)])),
                        child: SvgPicture.asset(
                          _horizontalListImages[index],
                          height: 5,
                          width: 10,
                          fit: BoxFit.contain,
                          color: _currentIndexHorizontalList == index
                              ? Colors.white
                              : Colors.grey,
                        )),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBotttomNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.transparent,
        height: 100,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
                CustomPaint(
                  painter: BottomItemPainter(),
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(color: ColorsResource.black70),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _currentIndex == 0
                        ? _activeItemBottomBar("assets/bicycle.svg", 0)
                        : _itemBottomBar("assets/bicycle.svg", 0),
                    _currentIndex == 1
                        ? _activeItemBottomBar("assets/tab_bar/map.fill.svg", 1)
                        : _itemBottomBar("assets/tab_bar/map.fill.svg", 1),
                    _currentIndex == 2
                        ? _activeItemBottomBar(
                            "assets/tab_bar/person.fill.svg", 2)
                        : _itemBottomBar("assets/tab_bar/person.fill.svg", 2),
                    _currentIndex == 3
                        ? _activeItemBottomBar(
                            "assets/tab_bar/cart.fill.svg", 3)
                        : _itemBottomBar("assets/tab_bar/cart.fill.svg", 3),
                    _currentIndex == 4
                        ? _activeItemBottomBar(
                            "assets/tab_bar/doc.text.fill.svg", 4)
                        : _itemBottomBar("assets/tab_bar/doc.text.fill.svg", 4),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _activeItemBottomBar(String img, int index) {
    return InkWell(
      onTap: () => setState(() {
        _currentIndex = index;
      }),
      child: Container(
        width: 60,
        height: 60,
        child: CustomPaint(
          painter: BottomItemPainter(),
          child: Center(
              child: SvgPicture.asset(
            img,
            color: Colors.white,
          )),
        ),
      ),
    );
  }

  Widget _itemBottomBar(String img, int index) {
    return InkWell(
      onTap: () => setState(() {
        _currentIndex = index;
      }),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SvgPicture.asset(
          img,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildProduct(ProductModel data) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => DetailsScreen(),
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      child: CustomPaint(
        painter: CurvePainter(),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(data.isFavorite
                      ? "assets/Vector.svg"
                      : "assets/Outline.svg"),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset("assets/Electric%20Bicycle.I05 2.png"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  data.categoryName,
                  style: TextStyle(
                      color: Colors.white.withOpacity(.6),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  data.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  data.price,
                  style: TextStyle(
                      color: Colors.white.withOpacity(.6),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTopBar() {
    return Row(
      children: [
        Text(
          "Choose Your Bike",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient:
                  LinearGradient(colors: ColorsResource.searchGradientColor)),
          child: Center(
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}

class CustomShapeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ContainerShapePainter(),
      child: Container(
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/Electric%20Bicycle.I05 2.png"),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: DimensionsResource.defaultMargin),
              child: Text(
                "30% Off",
                style: TextStyle(
                    color: ColorsResource.reductionColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
