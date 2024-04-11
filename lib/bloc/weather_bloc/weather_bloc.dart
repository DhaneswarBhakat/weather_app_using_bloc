import 'package:weather_app_using_bloc/data/repository/weather_repo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;
  WeatherBloc({required this.weatherRepo}) : super(WeatherIsNotSearched()) {
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
    FetchWeather event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherIsLoading());
    try {
      final weather = await weatherRepo.getWeather(event.city);
      final city = event.city;

      emit(WeatherIsLoaded(weather, city));
    } catch (_) {
      emit(WeatherFailure());
    }
  }
}
