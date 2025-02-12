import 'package:flutter/material.dart';
import 'package:weather_app/model/weathermodel.dart';
import 'package:weather_app/service/weatherservice.dart';
class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {


  // api key 
  final _weatherService=WeatherService('f2e1aeca94192f1bff258e22b9d82121 ');
  Weather? _weather;
 
  // fetch weather 
  _fetchWeather() async {
    // grt current city /
    String cityName=await _weatherService.getCurrentCity();

    // get weather for the  city 
    try {
      final weather =await _weatherService.getWeather(cityName);
      setState(() {
        _weather =weather;
      });
    }
  //  any errors 
  catch(e){
    print(e);
  }

  }
  // weather animations 

// init state 
  @override
  void initState(){
    super.initState();

    // fetch weather on staartup
    _fetchWeather();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // city name 
          Text(_weather?.cityName ?? "Loading city..."),
        
          // temperature 
          Text('${_weather?.temperature.round().toString()}°C')
        ],),
      ),
    );
  }
}