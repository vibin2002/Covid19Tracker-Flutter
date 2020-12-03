import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/data_source.dart';
import 'package:flutter_app/panels/info_panel.dart';
import 'package:flutter_app/panels/most_affected_countries.dart';
import 'package:flutter_app/panels/worldwidepanel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchWorldWideData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v3/covid-19/all");
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;

  fetchCountryData() async {
    http.Response response =
        await http.get("https://corona.lmao.ninja/v3/covid-19/countries");
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("COVID-19 TRACKER")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              color: Colors.orange[100],
              child: Text(DataSource.quote,
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Worldwide",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Regional",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null
                ? Center(child: CircularProgressIndicator())
                : WorldwidePanel(
                    worldData: worldData,
                  ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Most affected countries",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            countryData == null ? Container() : MostAffectedPanel(countryData: countryData,),
            InfoPanel(),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
