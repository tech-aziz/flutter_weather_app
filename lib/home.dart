import 'package:flutter/material.dart';
import 'package:flutter_weather_app/app/config/style/custom_text_style.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:  Text('Weather',style: textStyle(textColor: Colors.white),),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Weather Details'),
      ),
    );
  }
}
