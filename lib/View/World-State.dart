import 'package:covidtutorials/Modle/WorldStatesModle.dart';
import 'package:covidtutorials/Modle/services/states-services.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Countries_list.dart';

class WorldsStatesScreen extends StatefulWidget {
  const WorldsStatesScreen({Key? key}) : super(key: key);

  @override
  State<WorldsStatesScreen> createState() => _WorldsStatesScreenState();
}

class _WorldsStatesScreenState extends State<WorldsStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 4), vsync: this)
        ..repeat();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Tutorials'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              FutureBuilder(
                  future: statesServices.futureWorldStatesRecords(),
                  builder: (context, AsyncSnapshot<WorldStatesModle> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(flex: 1, child: SpinKitFadingCircle(
                        itemBuilder: (BuildContext context, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                              color: index.isEven ? Colors.red : Colors.green,
                            ),
                          );
                        },

                      ));
                    } else {
                      return Expanded(child: Column(
                        children: [
                          PieChart(
                            dataMap:  {
                             "Totall": double.parse(snapshot.data!.cases!.toString()),

                              "Recovered": double.parse(snapshot.data!.recovered!.toString()),
                              "Deaths": double.parse(snapshot.data!.deaths!.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            animationDuration: Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorList,
                            chartRadius: MediaQuery.of(context).size.height * 1.2,
                            legendOptions:
                            LegendOptions(legendPosition: LegendPosition.left),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: MediaQuery.of(context).size.height * 0.06),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(
                                    title: 'total',
                                    value: snapshot.data!.cases!.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Recovered',
                                    value: snapshot.data!.recovered!.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Deaths',
                                    value: snapshot.data!.deaths.toString(),
                                  ),
                                  ReusableRow(title: "Today Cases", value: snapshot.data!.todayCases.toString()),
                                  ReusableRow(title: "Today Recovered", value: snapshot.data!.todayRecovered.toString()),
                                  ReusableRow(title: "todayDeaths", value: snapshot.data!.todayDeaths.toString()),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> CountriesListScreen()));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("Track Countires"),
                              ),
                            ),
                          )
                        ],
                      ));
                    }
                  }),

            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}
