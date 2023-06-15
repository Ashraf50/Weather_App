import 'package:flutter/material.dart';
import 'package:wether/pages/searchPage.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFfed081),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(updateUi: updateUi),
                  ),
                );
              },
              icon: Icon(Icons.search),
            ),
          ],
          title: Text('Weather App'),
        ),
        body: weatherData == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFfed081),
                    Color.fromARGB(223, 254, 208, 129),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${weatherData?.weatherState}",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Sky",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                      Center(
                        child: Column(
                          children: [
                            Image.network(
                              "https:${weatherData?.Icon}",
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${weatherData?.cityName}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${weatherData?.temp.round()}°",
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                          Row(
                            children: [
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Wind",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 140, 137, 137),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "${weatherData?.wind} Km/h",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Humidity",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 140, 137, 137),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "${weatherData?.humidity}%",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

// Center(
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "${weatherData?.cityName}",
              //       style: TextStyle(
              //         fontSize: 25,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     SizedBox(
              //       height: 20,
              //     ),
              //     Text(
              //       "Updated : ${weatherData?.date}",
              //       style: TextStyle(fontSize: 16),
              //     ),
              //     SizedBox(
              //       height: 25,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(10),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Image.network("https:${weatherData?.Icon}"),
              //           Text(
              //             "${weatherData?.temp.round()}°",
              //             style: TextStyle(fontSize: 25),
              //           ),
              //           Column(
              //             children: [
              //               Text(
              //                 "Max Temp: ${weatherData?.humidity}",
              //                 style: TextStyle(fontSize: 15),
//                             ),
//                             Text(
//                               "Min Temp: ${weatherData?.min_temp}",
//                               style: TextStyle(fontSize: 15),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Text(
//                     "${weatherData?.weatherState}",
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

