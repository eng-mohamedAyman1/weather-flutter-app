import 'package:flutter/material.dart';

import 'WeatherModel.dart';
import 'WeatherService.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
WeatherModel? model;
class SearchScreen extends StatefulWidget {
  VoidCallback? UpDate;
   SearchScreen(this.UpDate);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? CityName;
  bool _saving = false;
  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _saving,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.blueAccent,
              title: const Text(
              "Search a City",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(

                  onSubmitted: (data)async{
                    CityName= data ;
                    setState(() {
                      _saving=true;
                    });
                    WeatherService? weather = WeatherService();
                    model=await weather.weatherSearch(cityName:  CityName!) as WeatherModel?;
                   // model =await weather?.weatherSearch(CityName!) as WeatherModel?;
                    widget.UpDate!();
                    setState(() {
                      _saving=false;
                    });
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                     hintText: "Enter city Name",
                    labelText: "Search",
                    suffixIcon: IconButton(icon: Icon(
                      color: Colors.blueAccent,
                      Icons.search,
                    ),onPressed: (){},),
                    labelStyle:const TextStyle(color: Colors.blueAccent),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
