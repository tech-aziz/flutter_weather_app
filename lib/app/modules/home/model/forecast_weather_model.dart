// ignore: file_names
class ForecastWeatherModel {
  Location? location;
  CurrentWeather? current;
  List<ForecastDay>? forecastDay;

  ForecastWeatherModel({
    this.location,
    this.current,
    this.forecastDay,
  });

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    return ForecastWeatherModel(
      location: Location.fromJson(json['location']),
      current: CurrentWeather.fromJson(json['current']),
      forecastDay: List<ForecastDay>.from(
          json['forecast']['forecastday'].map((x) => ForecastDay.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location?.toJson(),
      'current': current?.toJson(),
      'forecast': {'forecastday': forecastDay?.map((x) => x.toJson()).toList()},
    };
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'] ?? '',
      country: json['country'],
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      tzId: json['tz_id'],
      localtime: json['localtime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'tz_id': tzId,
      'localtime': localtime,
    };
  }
}

class CurrentWeather {
  double? tempC;
  double? tempF;
  bool? isDay;
  Condition? condition;
  double? windKph;
  double? windDegree;
  String? windDir;
  double? pressureMb;
  double? precipMm;
  int? humidity;
  double? feelsLikeC;
  double? feelsLikeF;
  double? visKm;

  CurrentWeather({
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.precipMm,
    this.humidity,
    this.feelsLikeC,
    this.feelsLikeF,
    this.visKm,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      tempC: json['temp_c'].toDouble(),
      tempF: json['temp_f'].toDouble(),
      isDay: json['is_day'] == 1,
      condition: Condition.fromJson(json['condition']),
      windKph: json['wind_kph'].toDouble(),
      windDegree: json['wind_degree'].toDouble(),
      windDir: json['wind_dir'],
      pressureMb: json['pressure_mb'].toDouble(),
      precipMm: json['precip_mm'].toDouble(),
      humidity: json['humidity'],
      feelsLikeC: json['feelslike_c'].toDouble(),
      feelsLikeF: json['feelslike_f'].toDouble(),
      visKm: json['vis_km'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay == true ? 1 : 0,
      'condition': condition?.toJson(),
      'wind_kph': windKph,
      'wind_degree': windDegree,
      'wind_dir': windDir,
      'pressure_mb': pressureMb,
      'precip_mm': precipMm,
      'humidity': humidity,
      'feelslike_c': feelsLikeC,
      'feelslike_f': feelsLikeF,
      'vis_km': visKm,
    };
  }
}

class Condition {
  String? text;
  String? icon;

  Condition({
    this.text,
    this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'icon': icon,
    };
  }
}

class ForecastDay {
  String? date;
  DayWeather? dayWeather;
  Astro? astro;
  List<HourWeather>? hourlyWeather;

  ForecastDay({
    this.date,
    this.dayWeather,
    this.astro,
    this.hourlyWeather,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      dayWeather: DayWeather.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
      hourlyWeather: List<HourWeather>.from(
          json['hour'].map((x) => HourWeather.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'day': dayWeather,
      'astro': astro?.toJson(),
      'hour': hourlyWeather?.map((x) => x.toJson()).toList(),
    };
  }
}

class DayWeather {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? totalsnowCm;
  double? avgvisKm;
  double? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  DayWeather({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory DayWeather.fromJson(Map<String, dynamic> json) {
    return DayWeather(
      maxtempC: json['maxtemp_c'],
      maxtempF: json['maxtemp_f'],
      mintempC: json['mintemp_c'],
      mintempF: json['mintemp_f'],
      avgtempC: json['avgtemp_c'],
      avgtempF: json['avgtemp_f'],
      maxwindMph: json['maxwind_mph'],
      maxwindKph: json['maxwind_kph'],
      totalprecipMm: json['totalprecip_mm'],
      totalprecipIn: json['totalprecip_in'],
      totalsnowCm: json['totalsnow_cm'],
      avgvisKm: json['avgvis_km'],
      avgvisMiles: json['avgvis_miles'],
      avghumidity: json['avghumidity'],
      dailyWillItRain: json['daily_will_it_rain'],
      dailyChanceOfRain: json['daily_chance_of_rain'],
      dailyWillItSnow: json['daily_will_it_snow'],
      dailyChanceOfSnow: json['daily_chance_of_snow'],
      condition: json['condition'] != null ? Condition.fromJson(json['condition']) : null,
      uv: json['uv'],
    );
  }
}


class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonrise: json['moonrise'],
      moonset: json['moonset'],
      moonPhase: json['moon_phase'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moonPhase,
    };
  }
}

class HourWeather {
  String? time;
  double? tempC;
  bool? isDay;
  Condition? condition;
  double? windKph;
  int? humidity;
  double? feelsLikeC;

  HourWeather({
    this.time,
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.humidity,
    this.feelsLikeC,
  });

  factory HourWeather.fromJson(Map<String, dynamic> json) {
    return HourWeather(
      time: json['time'],
      tempC: json['temp_c'].toDouble(),
      isDay: json['is_day'] == 1,
      condition: Condition.fromJson(json['condition']),
      windKph: json['wind_kph'].toDouble(),
      humidity: json['humidity'],
      feelsLikeC: json['feelslike_c'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'temp_c': tempC,
      'is_day': isDay == true ? 1 : 0,
      'condition': condition?.toJson(),
      'wind_kph': windKph,
      'humidity': humidity,
      'feelslike_c': feelsLikeC,
    };
  }
}
