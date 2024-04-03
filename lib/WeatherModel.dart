class WeatherModel {
  final String Cityname;
  final String localtime;
  final String icon;
  final String StateWeather;
  final double temp;
  final double Mitemp;
  final double Maxtemp;

  WeatherModel(
      {required this.Cityname,
      required this.localtime,
      required this.icon,
      required this.StateWeather,
      required this.temp,
      required this.Mitemp,
      required this.Maxtemp});
}
