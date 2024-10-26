import 'package:flutter/material.dart';
import 'package:ovid_app/View/world_State.dart';

class DetailsScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      active,
      critical,
      todayRecovered,
      test,
  totalRecovered;
  DetailsScreen( {
    required this.name,
    required this.image,
    this.totalCases = 0,
    this.active = 0,
   this.critical = 0,
   this.todayRecovered = 0,
   this.test = 0,
   this.totalDeaths = 0,
    this.totalRecovered = 0,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child:
                      Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .06,),
                          ReusableRow(title: 'Cases', value: widget.totalCases.toString()),
                          ReusableRow(title: 'Critical', value: widget.critical.toString()),
                          ReusableRow(title: 'test', value: widget.test.toString()),
                          ReusableRow(title: 'Today Recovered', value: widget.totalRecovered.toString()),
                          ReusableRow(title: 'Total Deaths', value: widget.totalDeaths.toString()),
                        ],
                      ),


                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
