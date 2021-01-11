import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

import '../data/model/weather.dart';
import '../data/weather_repository.dart';
import '../data/weather_repository.dart';
import '../data/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _WeatherRepository;

  WeatherCubit(this._WeatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await _WeatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError("Couldn't fetch weather"));
    }
  }
}
