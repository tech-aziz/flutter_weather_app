import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/app/config/style/color.dart';
import 'package:flutter_weather_app/app/config/style/custom_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/components/custom_weather_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List weatherTimeList = [
    customWeatherContainer(time: 'Now',img: 'assets/icons/cloudy.png',celsius: '13'),
    customWeatherContainer(time: '4PM',img: 'assets/icons/sun.png',celsius: '14'),
    customWeatherContainer(time: '5PM',img: 'assets/icons/partly_cloudy.png',celsius: '12'),
    customWeatherContainer(time: '6PM',img: 'assets/icons/rainy.png',celsius: '8'),
    customWeatherContainer(time: '7PM',img: 'assets/icons/partly_cloudy.png',celsius: '9'),
    customWeatherContainer(time: '8PM',img: 'assets/icons/cloudy.png',celsius: '2'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor, // First color
              AppColors.secondaryColor, // Second color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight, // End at the bottom right
          ),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Dhaka',
                      style: textStyle(
                          textColor: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Current Location',
                          style: textStyle(
                              textColor: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 150,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/icons/cloudy.png',
                                  height: 130,
                                  width: 135,
                                ),
                              ),




                              Expanded(
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                          text: '13',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 100,
                                          )),
                                      TextSpan(
                                          text: '0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 100,
                                              fontFeatures: [FontFeature.superscripts()])),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Partly Cloud - H:17o L:4o',
                          style: textStyle(
                            fontSize: 18,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.white.withOpacity(0.1)),
                          child: const Center(
                            child: Text(
                              'Today',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black.withOpacity(0.1)),
                          child: const Center(
                            child: Text(
                              'Next Days',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: weatherTimeList.length,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: weatherTimeList[index],
                          );
                        },
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Stack(

                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryColor, // First color
                              AppColors.secondaryColor, // Second color
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight, // End at the bottom right
                          ),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                            child: Container(
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 2, color: Colors.white.withOpacity(0.5)),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.01),
                                    // First color
                                    Colors.white.withOpacity(0.0001),
                                    // Second color
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment
                                      .bottomRight, // End at the bottom right
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/sun.svg',
                                          height: 56,
                                          width: 56,
                                        ),
                                        const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Sunset',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '5:51PM',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sunrise',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          '7:00AM',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    width: 2, color: Colors.white.withOpacity(0.5)),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.01),
                                    // First color
                                    Colors.white.withOpacity(0.0001),
                                    // Second color
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment
                                      .bottomRight, // End at the bottom right
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/sun-1.svg',
                                          height: 56,
                                          width: 56,
                                        ),
                                        const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'UV Index',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '1 Low',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12,),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 190,
                      bottom: 270,
                      child: ClipRRect(
                        clipBehavior: Clip.none,
                        child: Container(
                          height: 70,  // Increased height and width to fit padding
                          width: 70,
                          padding: const EdgeInsets.all(6),  // Padding around the inner container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primaryColor, // First color
                                AppColors.secondaryColor, // Second color
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight, // End at the bottom right
                            ),  // White color around the circle
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.1), // First color
                                  AppColors.secondaryColor, // Second color
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight, // End at the bottom right
                              ),
                            ),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
