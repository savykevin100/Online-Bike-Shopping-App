import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statistique_progress/core/colors.dart';
import 'package:statistique_progress/core/dimensions.dart';
import 'package:statistique_progress/main_screen.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>
    with TickerProviderStateMixin {
  bool animated = false;

  List<Map<String, dynamic>> _cardItems = [
    {
      "img": "assets/cobi-krumholz-mZKF19ydEzk-unsplash-removebg-preview 1.png",
      "name": "SMITH - Trade",
      "price": "\$ 1,999.99"
    },
    {
      "img": "assets/Electric%20Bicycle.I05 2.png",
      "name": "PILOT - CHROMOLY 520",
      "price": "\$ 3,999.99"
    },
    {
      "img": "assets/robert-bye-tG36rvCeqng-unsplash-removebg-preview 5.png",
      "name": "PEUGEOT- LR01",
      "price": "\$ 120"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Container(
              color: ColorsResource.black70,
              child: Container(
                padding: const EdgeInsets.all(DimensionsResource.defaultMargin),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    buildTopBar(context),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final item = _cardItems[index];
                                return _buildCardItem(
                                    item['img'], item['name'], item['price']);
                              },
                              separatorBuilder: (context, builder) {
                                return Divider(
                                  color: Colors.white.withOpacity(.2),
                                );
                              },
                              itemCount: _cardItems.length),
                          SizedBox(
                            height: 35,
                          ),
                          _buildTextFiledPromoCode(),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Your bag qualifies for free shipping",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white.withOpacity(.6),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          _buildDetailsCheckout("Subtotal:", "\$6,119.99"),
                          SizedBox(
                            height: 10,
                          ),
                          _buildDetailsCheckout("Delivery Fee:", "\$0"),
                          SizedBox(
                            height: 10,
                          ),
                          _buildDetailsCheckout("Discount:", "30%"),
                          SizedBox(
                            height: 30,
                          ),
                          _buildDetailsCheckout("Total:", "\$6,119.99",
                              isTotal: true),
                          SizedBox(
                            height: 20,
                          ),
                          _buildCheckoutButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return InkWell(
      onTap: () {
        setState(() {
          animated = true;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 5),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xff11161E),
            spreadRadius: 0,
            blurRadius: 30,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Color(0xff2B3545),
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(-2, -2),
          ),
        ], borderRadius: BorderRadius.circular(10), color: Color(0xff242C3B)),
        child: Stack(
          children: [
            Container(
              height: 50,
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              left: animated ? MediaQuery.of(context).size.width * .4 : 0.0,
              onEnd: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => MainScreen(),
                    transitionDuration: Duration(seconds: 1),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: ColorsResource.searchGradientColor)),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  if (!animated) ...[
                    Text(
                      "Checkout",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white.withOpacity(.6)),
                    ),
                    Text("")
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildDetailsCheckout(String title, String subtitle,
      {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white.withOpacity(.87),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Text(
          subtitle,
          style: TextStyle(
              color: isTotal ? Color(0xff38B8EA) : Colors.white.withOpacity(.6),
              fontSize: isTotal ? 17 : 15,
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400),
        ),
      ],
    );
  }

  Container _buildTextFiledPromoCode() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff191E29),
          spreadRadius: 0,
          blurRadius: 30,
          offset: Offset(4, 10),
        ),
      ], borderRadius: BorderRadius.circular(8), color: Color(0xff242C3B)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: TextStyle(color: Colors.white.withOpacity(.6)),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 38, vertical: 11),
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
                gradient:
                    LinearGradient(colors: ColorsResource.searchGradientColor)),
            child: Text(
              "Apply",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(String image, String name, String price) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            width: 120,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffFFFF).withOpacity(.2),
                  Color(0xff000000).withOpacity(.6)
                ]),
                borderRadius: BorderRadius.circular(30)),
            child: Image.asset(image),
          ),
          SizedBox(
            width: DimensionsResource.defaultMargin,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xff3D9CEA)),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Container(
                              height: 30,
                              width: 30,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff1A1F2C),
                                      spreadRadius: 0,
                                      blurRadius: 60,
                                      offset: Offset(0, 30),
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                      colors:
                                          ColorsResource.searchGradientColor)),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white.withOpacity(.6)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 30,
                              width: 30,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff1A1F2C),
                                    spreadRadius: 0,
                                    blurRadius: 60,
                                    offset: Offset(0, 30),
                                  ),
                                ],
                                color: Color(0xff262E3D),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white.withOpacity(.6),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient:
                    LinearGradient(colors: ColorsResource.searchGradientColor)),
            child: Center(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ),
        // Spacer(),
        Text(
          "My Shopping Cart",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text("")
      ],
    );
  }
}
