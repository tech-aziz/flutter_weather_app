import 'package:flutter/material.dart';

Widget customWeatherContainer(
    {required String time, required String img, required String celsius}) {
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
            border: Border.all(width: 2, color: Colors.white.withOpacity(0.2))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            Image.network(
              img.toString(),
              height: 48,
              width: 49.85,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: celsius..toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                  const TextSpan(
                      text: '°',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFeatures: [FontFeature.superscripts()],
                        fontSize: 22,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}
