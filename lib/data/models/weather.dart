class WeatherModel {
  final dynamic temp;
  final dynamic icon;

  WeatherModel({
    this.temp,
    this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json['main']['temp'],
      icon: json['weather'][0]['icon'],
    );
  }
}
