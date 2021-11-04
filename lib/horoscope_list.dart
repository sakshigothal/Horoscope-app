import 'package:flutter/material.dart';
import 'package:horoscope_app/selectedHoro.dart';

class HoroscopeList extends StatefulWidget {
  const HoroscopeList({Key? key}) : super(key: key);

  @override
  _HoroscopeListState createState() => _HoroscopeListState();
}

class _HoroscopeListState extends State<HoroscopeList> {
  List horoscopeAss = [
    "assets/Aquarius.png",
    "assets/Aries.png",
    "assets/Cancer.png",
    "assets/Capricorn.png",
    "assets/Gemini.png",
    "assets/Leo.png",
    "assets/Libra.png",
    "assets/Pisces.png",
    "assets/Sagittarius.png",
    "assets/Scorpio.png",
    "assets/Taurus.png",
    "assets/Virgo.png",
  ];
  List horoscopes = [
    "Aquarius",
    "Aries",
    "Cancer",
    "Capricorn",
    "Gemini",
    "Leo",
    "Libra",
    "Pisces",
    "Sagittarius",
    "Scorpio",
    "Taurus",
    "Vigro"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HoroScope App"),
      ),
      body: Container(
          // height: double.infinity,
          // width: double.infinity,
          color: Colors.redAccent,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => SelectedHoro(
                        selectedHoro: horoscopes[index],
                        select: horoscopeAss[index],
                      ),
                    ),
                  );
                },
                child: Container(
                    color: Colors.blue[900],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              horoscopeAss[index],
                            )),
                        Text(horoscopes[index]),
                      ],
                    )),
              );
            },
            itemCount: horoscopes.length,
          )),
    );
  }
}
