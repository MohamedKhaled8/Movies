import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../helper.dart';

class Top10 extends StatelessWidget {
  const Top10({
    Key? key,
    required this.size,
    required this.title,
    required this.img,
    required this.rate,
  
  }) : super(key: key);

  final Size size;
  final String title;
  final String img;
  final double rate; 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryColor,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2$img"),
                  fit: BoxFit.fill)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
              height: size.height * 0.07,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Center(
                child: Text(
                  cutFromBigTitle(title),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
              height: size.height * 0.07,
              width: size.width * 0.2,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                 rate.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ],
    );
  }
}