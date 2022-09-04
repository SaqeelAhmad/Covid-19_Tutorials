
import 'dart:core';
import 'dart:core';

import 'package:covidtutorials/View/World-State.dart';
import 'package:flutter/material.dart';


class detilescreen extends StatefulWidget {
  String name;
  String image;
 // int totalCases,totalDeaths,totalRecovered,active,critical,todayRecovered,test;
  int totalCases,totalRecovered,totalDeaths,todayRecovered,active,test,critical;
  detilescreen({required this.name,
  required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.todayRecovered,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.test,
  });

  @override
  State<detilescreen> createState() => _detilescreenState();
}

class _detilescreenState extends State<detilescreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding( padding:EdgeInsets.only(top: MediaQuery.of(context).size.height*0.067),
                child:
              Card(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.070,),
                    ReusableRow(title: "Total Cases", value: widget.totalCases.toString()),
                    ReusableRow(title: "Total Recovered", value: widget.totalRecovered.toString()),
                    ReusableRow(title: "Total Deaths", value: widget.totalDeaths.toString()),
                    ReusableRow(title: "Today Recovered", value: widget.todayRecovered.toString()),
                    ReusableRow(title: "Active", value: widget.active.toString()),
                    ReusableRow(title: "Test", value: widget.test.toString()),
                    ReusableRow(title: "Critical", value: widget.critical.toString()),
                  ],
                ),
              ),),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          ),
        ],
      ),

    );
  }
}
