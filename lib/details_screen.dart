import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:statistique_progress/checkout_screen.dart';
import 'package:statistique_progress/core/colors.dart';
import 'package:statistique_progress/core/dimensions.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> _images = [
    "assets/Electric%20Bicycle.I05 2.png",
    "assets/Electric%20Bicycle.I05 2.png",
    "assets/robert-bye-tG36rvCeqng-unsplash-removebg-preview 5.png"
  ];
  int position = 0;
  bool _openDescription = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    _images.forEach((element) {
      items.add(Image.asset(
        element,
        fit: BoxFit.cover,
      ));
    });
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomSheet: _buildBottomSheet(),
          body: _buildBody(items),
        ),
      ),
    );
  }

  Container _buildBody(List<Widget> items) {
    return Container(
        color: ColorsResource.black70,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                "assets/Rectangle 476.svg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(DimensionsResource.defaultMargin),
              child: ListView(
                children: [
                  buildTopBar(),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: _openDescription
                            ? 0
                            : MediaQuery.of(context).size.height * .05),
                    child: AnimatedContainer(
                      height: _openDescription ? 200 : 300,
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              position = index;
                            });
                          },
                        ),
                        items: items,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  DotsIndicator(
                    dotsCount: _images.length,
                    position: position,
                    decorator: DotsDecorator(
                      activeColor: Colors.white,
                      activeSize: const Size(9, 9),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildBottomSheet() {
    return AnimatedContainer(
      height: _openDescription ? 500.0 : 100.0,
      duration: const Duration(seconds: 3),
      curve: Curves.fastOutSlowIn,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          gradient: LinearGradient(
              colors: ColorsResource.bottomSheetBackgroundColor)),
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => setState(() {
                    _openDescription = !_openDescription;
                  }),
                  child: _openDescription
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff252B39),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(4, 4),
                                ),
                                BoxShadow(
                                  color: Color(0xff38445A),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(-4, -4),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: ColorsResource.descriptionCardColor),
                          child: Text(
                            "Description",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: _openDescription
                                    ? FontWeight.bold
                                    : FontWeight.w400,
                                fontSize: 15,
                                foreground: Paint()
                                  ..shader = _openDescription
                                      ? ColorsResource.textLinearGradientColor
                                      : ColorsResource.textColorDescription),
                          ),
                        )
                      : _buildNoActiveElement("Description"),
                ),
                _buildNoActiveElement("Specification")
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PEUGEOT - LR01",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white.withOpacity(.6)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Color(0xff262E3D),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff1C222E),
                    spreadRadius: 0,
                    blurRadius: 40,
                    offset: Offset(0, -10),
                  ),
                ],
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$ 1,999.99",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Color(0xff3D9CEA)),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => CheckoutScreen(),
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 38, vertical: 11),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff1A1F2C),
                              spreadRadius: 0,
                              blurRadius: 60,
                              offset: Offset(0, 30),
                            ),
                          ],
                          gradient: LinearGradient(
                              colors: ColorsResource.searchGradientColor)),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildNoActiveElement(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff202633),
          spreadRadius: 0,
          blurRadius: 8,
          offset: Offset(4, 4),
        ),
      ], borderRadius: BorderRadius.circular(15), color: Color(0xff28303F)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.white.withOpacity(.6)),
      ),
    );
  }

  Widget buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient:
                  LinearGradient(colors: ColorsResource.searchGradientColor)),
          child: Center(
            child: InkWell(
              onTap: () {
                if (!_openDescription) {
                  Navigator.pop(context);
                } else {
                  setState(() {
                    _openDescription = !_openDescription;
                  });
                }
              },
              child: Icon(
                _openDescription
                    ? Icons.keyboard_arrow_down_sharp
                    : Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
        // Spacer(),
        Text(
          "PEUGEOT - LR01",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text("")
      ],
    );
  }
}
