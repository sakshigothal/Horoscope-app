import 'package:flutter/material.dart';
import 'package:horoscope_app/horoscope_list.dart';

void main() {
  runApp(const MaterialApp(home: HoroscopeList(),));
}

class HoroscopeSplash extends StatefulWidget {
  const HoroscopeSplash({ Key? key }) : super(key: key);

  @override
  _HoroscopeSplashState createState() => _HoroscopeSplashState();
}

class _HoroscopeSplashState extends State<HoroscopeSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
      ),
    );
  }
}