import 'package:neev123dev/dto/countries_info_dto.dart';
import 'package:neev123dev/dto/global_info_dto.dart';
import 'package:neev123dev/dto/timeline/country_info_timeline_dto.dart';

class CacheManager {
  static final CacheManager _cacheManager = CacheManager._internal();

  factory CacheManager() => _cacheManager;

  CacheManager._internal();

  GlobalInfoDto globalInfoDto;
  List<CountriesInfoDto> countriesInfoDto;
  CountryInfoTimelineDto countryInfoTimelineDto;
}