import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_universe_app/constants.dart';
import 'package:flutter_universe_app/data.dart';
import 'package:flutter_universe_app/details_screen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.7]),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expore",
                      // style: google_fontStyle..copyWith(),

                      // google_fontStyle

                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 44,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 10),
                      child: DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Solar system",
                              style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 20,
                                  color: titleTextColor.withOpacity(0.5),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                        icon: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Image.asset("assets/drop_down_icon.png"),
                        ),
                        underline: SizedBox(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.pink, activeSize: 20, space: 8)),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      planetInfo: planets[index],
                                    )));
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                elevation: 8,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Text(
                                        planets[index].name,
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 44,
                                            color: Color(0xff47455f),
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Solar system",
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 20,
                                            color: Color(0xff47455f),
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Know More",
                                            style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 20,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_right_alt_outlined,
                                            color: secondaryTextColor,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Hero(
                              tag: planets[index].position,
                              child: Image.asset(planets[index].iconImage))
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: navigationColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38), topRight: Radius.circular(38))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {}, icon: Image.asset("assets/menu_icon.png")),
            IconButton(
                onPressed: () {}, icon: Image.asset("assets/search_icon.png")),
            IconButton(
                onPressed: () {}, icon: Image.asset("assets/profile_icon.png")),
          ],
        ),
      ),
    );
  }
}
