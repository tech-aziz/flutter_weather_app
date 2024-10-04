import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/routes/app_routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../res/style/app_string.dart';
import '../../../res/style/custom_text_style.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4065F0), // First color
              Color(0xff9A75FD), // Second color
            ],
            begin: Alignment.bottomCenter, // Start from the top left
            end: Alignment.topCenter, // End at the bottom right
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: AppString.appName,
                        style: textStyle(
                            fontSize: 30, textColor: const Color(0xffFBFBFB))),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AutoSizeText(
                      AppString.poweredBy,
                      style: textStyle(textColor: Colors.white.withOpacity(0.6), fontSize: 12),
                    ),
                  ),
                  const SizedBox(width: 4,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AutoSizeText(
                      AppString.companyName,
                      style: textStyle(textColor: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
