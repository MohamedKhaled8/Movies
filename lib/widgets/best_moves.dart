import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../helper.dart';

class BestMove extends StatelessWidget {
  const BestMove({
    Key? key,
    required this.size,
    required this.name,
    required this.poster,
    required this.rate,
    
  }) : super(key: key);

  final Size size;
  final String name;
  final String poster;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Container(
     
      margin: const EdgeInsets.all(5),
      height: size.height * 0.3,
      width: size.width * 0.3,
      // color: Colors.white,
      child: Stack(children: [ 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryColor,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2$poster'),
                      fit: BoxFit.cover)),
            ),
            Text(
              cutFromBigTitle(name) , style:const  TextStyle(
                color: fontColor , fontSize: 15
              ),
            )
          ],
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              // ignore: sort_child_properties_last
              child: Center(
                child: Text(
                  rate.toString(),
                  textAlign: TextAlign.center,
                  style:const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              height: size.height * 0.05,
              width: size.width * 0.1,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
            )),
      ]),
    );
  }
}
