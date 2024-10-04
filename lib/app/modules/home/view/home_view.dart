import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/app/modules/home/model/forecast_weather_model.dart';
import 'package:get/get.dart';
import '../../../res/components/custom_button.dart';
import '../../../res/components/custom_weather_container.dart';
import '../../../res/style/app_string.dart';
import '../../../res/style/color.dart';
import '../../../res/style/custom_text_style.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
  }

  //user will exit or not section start
  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 10,
          contentPadding: const EdgeInsets.all(30.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          // alignment: Alignment.center,
          content: Text(AppString.exitMessage,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.9)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      exit(0);
                    },
                    child: customButton(
                        textColor: Colors.black,
                        btnName: 'Yes',
                        borderColor: Colors.black.withOpacity(.1),
                        color: Colors.white60,
                        context: context,
                        border: Border.all(
                            width: 1,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Get.back();
                    },
                    child: customButton(
                        textColor: Colors.black,
                        btnName: 'No',
                        borderColor: Colors.black.withOpacity(.1),
                        context: context,
                        color: Colors.white60,
                        border: Border.all(
                            width: 1,
                            color: Colors.black.withOpacity(0.5))),
                  ),
                ),
              ],
            )
          ],
        );
      },
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => showExitPopup(),
        child: RefreshIndicator(
          strokeWidth: 2.0,
          color: AppColors.primaryColor,
          onRefresh: () async {},
          child: FutureBuilder<ForecastWeatherModel>(
            future: controller.getForecastWeather(),
            builder: (BuildContext context,
                AsyncSnapshot<ForecastWeatherModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primaryColor,
                  ),
                );
              } else if (snapshot.hasData) {
                String demo = snapshot.data!.current!.condition!.icon.toString();
                String imageUrl = demo.replaceFirst("//", "");
                return Container(
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
                                controller.forecastWeatherModel.value.location!.name
                                    .toString(),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: imageUrl.isNotEmpty
                                              ? Image.network(
                                                  'https://$imageUrl',
                                                  height: 160,
                                                  width: 165,
                                                  fit: BoxFit.contain,
                                                )
                                              : Image.asset(
                                                  'assets/icons/cloudy.png',
                                                  height: 140,
                                                  width: 135,
                                                ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text:
                                                      '${controller.forecastWeatherModel.value.current!.feelsLikeC!.toInt()}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 80,
                                                  )),
                                              const TextSpan(
                                                  text: '°',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFeatures: [
                                                      FontFeature.superscripts()
                                                    ],
                                                    fontSize: 60,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${controller.forecastWeatherModel.value.current!.condition!.text} - H:${controller.forecastWeatherModel.value.forecastDay![0].dayWeather!.maxtempC} L:${controller.forecastWeatherModel.value.forecastDay![0].dayWeather!.mintempC}',
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
                                  InkWell(
                                    onTap: () => Get.snackbar(
                                        "Today\'s weather", "Development ongoing",
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: Colors.red),
                                    child: Container(
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
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  InkWell(
                                    onTap: () => Get.snackbar(
                                        "Next Days weather", "Development ongoing",
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.TOP,
                                        backgroundColor: Colors.red),
                                    child: Container(
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
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: controller.forecastWeatherModel.value
                                      .forecastDay![0].hourlyWeather!.length,
                                  shrinkWrap: true,
                                  primary: false,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final data = controller
                                        .forecastWeatherModel
                                        .value
                                        .forecastDay![0]
                                        .hourlyWeather![index];
          
                                    String demo = data.condition!.icon!
                                        .replaceFirst("//", "");
          
          
                                    return Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 8),
                                      child: customWeatherContainer(
                                        celsius: data.tempC!.toInt().toString(),
                                        img: 'https://$demo',
                                        time: controller.convertToTime(data.time.toString()),
                                      ),
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
                                      end: Alignment
                                          .bottomRight, // End at the bottom right
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 8),
                                      child: Container(
                                        height: 90,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(
                                              width: 2,
                                              color: Colors.white.withOpacity(0.5)),
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/sun.svg',
                                                    height: 56,
                                                    width: 56,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Sunset',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
                                                      Text(
                                                        '${controller.forecastWeatherModel.value.forecastDay![0].astro!.sunset}',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Sunrise',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
                                                      Text(
                                                        '${controller.forecastWeatherModel.value.forecastDay![0].astro!.sunrise}',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        height: 90,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(
                                              width: 2,
                                              color: Colors.white.withOpacity(0.5)),
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/sun-1.svg',
                                                    height: 56,
                                                    width: 56,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'UV Index',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
                                                      Text(
                                                        '${controller.forecastWeatherModel.value.forecastDay![0].dayWeather!.uv}',
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w500),
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
                                    const SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text('No data found'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
