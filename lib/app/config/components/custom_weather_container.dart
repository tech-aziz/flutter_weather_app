import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customWeatherContainer({required String time, required String img, required String celsius}){
  return Stack(
    alignment: Alignment.center,
    // Align the containers on top of each other
    children: [
      // Outer Container with gradient border
      Container(
        height: 140,
        // Increase size slightly for outer container
        width: 67,
        // Increase size slightly for outer container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(.2),
              // Start color of the gradient
              Colors.white.withOpacity(0.0),
              // End color of the gradient
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      // Inner Container with solid background
      Container(
        height: 140, // Original height
        width: 67, // Original width
        decoration: BoxDecoration(
            color: Colors.transparent,
            // Background color of the inner container
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                width: 2,
                color:
                Colors.white.withOpacity(0.2))),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: [
             Text(
              time.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Image.asset(
              img.toString(),
              height: 48,
              width: 49.85,
            ),
             Text(
              celsius.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    ],
  );
}