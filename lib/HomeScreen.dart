import 'package:flutter/material.dart';
import 'package:weather/WeatherService.dart';

import 'SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void UpData(){
    setState((){});
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation:2 ,
          backgroundColor: Colors.blue.shade600,
          title: const Text(
            "Weather",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchScreen(UpData);
                }));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),

        body: (model==null)? const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "there is no weather 😔  ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
              ),
              Text(
                " start searching now 🔎 ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ):Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient:  LinearGradient(
                  colors: [
                    Colors.blue ,
                    Colors.blue.shade300,
                    Colors.blue.shade200,
                    Colors.blue.shade100,
                  ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3,),
                Text('${model?.Cityname}',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),

                Text('UpDated at  ${DateTime.parse(model!.localtime).hour} : ${DateTime.parse(model!.localtime).minute.toString() } ',style: const TextStyle(fontSize: 18,),),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.lightBlue,
                      child: Image(image: NetworkImage("https:${model!.icon}"),
                                         ),
                    ),
                  Text('${model?.temp}',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    Column(
                      children: [
                        Text('max: ${model?.Maxtemp}',style: const TextStyle(fontSize: 18,),),
                        Text('min: ${model?.Mitemp}',style: const TextStyle(fontSize: 18,),),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Text('${model?.StateWeather}',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                const Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
