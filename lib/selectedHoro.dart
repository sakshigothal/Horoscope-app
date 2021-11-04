// import 'package:assigment/horoscopelist.dart';
// import 'package:assigment/models/todaymodel.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:horoscope_app/common.dart';
import 'package:horoscope_app/models/horoscopemodel.dart';
import 'package:http/http.dart' as http;

class SelectedHoro extends StatefulWidget {
  // final selectedhoro;
  // final image;
  final String selectedHoro;
  final String select;
  const SelectedHoro({
    Key? key,
    required this.selectedHoro,
    required this.select,
  }) : super(key: key);

  @override
  _SelectedHoroState createState() => _SelectedHoroState();
}

class _SelectedHoroState extends State<SelectedHoro> {
  // var resp;
  HoroScopeModel? model;
  Map<String, dynamic> response = {};
  bool isload = false;

  @override
  void initState() {
    super.initState();
    isload = true;
    setState(() {
      Common.tmy = "today";
    });
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horoscope App"),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //horoscope-api.herokuapp.com/horoscope/today/Libra
                      setState(() {
                        Common.tmy = "today";
                      });
                      apicall();
                    },
                    child: Text("today"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Common.tmy = "month";
                      });
                      apicall();
                    },
                    child: Text("month"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Common.tmy = "year";
                      });
                      apicall();
                    },
                    child: Text("year"),
                  ),
                ],
              ),
              Text(
                "${widget.selectedHoro}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Common.tmy == "today" ? Text("${response["date"]}") : Text(""),
              Image.asset(widget.select),
              isload ?Padding(
                padding: const EdgeInsets.all(25),
                child:  Text("${response["horoscope"]}") ,
              ): CircularProgressIndicator(),
            ],
          );
        },
        itemCount: 1,
      )),
    );
  }

  apicall() async {
    // print("name is ${nameStr}");
    var resp = await http.get(Uri.parse(
        "https://horoscope-api.herokuapp.com/horoscope/${Common.tmy}/" +
            widget.selectedHoro));
    // print(resp.body);
    setState(() {
      response = jsonDecode(resp.body);
    });
// print(response["horoscope"]);
    // print(resp)
    // var response = json.decode(resp.body);
  }
}
