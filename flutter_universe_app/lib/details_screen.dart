import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_universe_app/constants.dart';
import 'package:flutter_universe_app/data.dart';

class DetailScreen extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailScreen({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(planetInfo.description);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        // top: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(38.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 300,
                        ),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 56,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Solar System",
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 31,
                              color: primaryTextColor,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.left,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          // "",
                          planetInfo.description ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              color: primaryTextColor.withOpacity(0.7),
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 30,
                          color: primaryTextColor,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  // Divider(
                  // thickness: 1,
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: planetInfo.images.length,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
                right: -64,
                child: Hero(
                    tag: planetInfo.position,
                    child: Image.asset(planetInfo.iconImage))),
            Positioned(
                top: 60,
                left: 32,
                child: Text(
                  planetInfo.position.toString(),
                  style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 248,
                      color: contentTextColor.withOpacity(0.09),
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.left,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: contentTextColor,
                ))
          ],
        ),
      ),
    );
  }
}
