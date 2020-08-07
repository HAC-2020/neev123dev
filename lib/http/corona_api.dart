import 'dart:async';
import 'dart:convert';
import 'dart:io' show HttpStatus;

import 'package:neev123dev/dto/countries_info_dto.dart';
import 'package:neev123dev/dto/global_info_dto.dart';
import 'package:neev123dev/dto/timeline/country_info_timeline_dto.dart';
import 'package:neev123dev/dto/usa/usa_state_info.dart';
import 'package:neev123dev/http/api_config.dart';
import 'package:neev123dev/repository/corona_bloc.dart';
import 'package:neev123dev/util/logging.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CoronaApi {
  Future<GlobalInfoDto> getGlobalInfo() async {
    try {
      final Uri uri = Uri.https(heroku_2_base_url, 'v2/all');
      final Response response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        return GlobalInfoDto.fromJsonMap(
          json.decode(response.body) as Map<String, dynamic>,
        );
      }
      CoronaBloc().globalInfoDtoBehaviorSubject$.addError(response.statusCode);
    } catch (e, s) {
      logger.severe("error while calling getGlobalInfo api", e, s);
      CoronaBloc().globalInfoDtoBehaviorSubject$.addError(e, s);
    }
    return null;
  }

  Future<List<CountriesInfoDto>> getAllCountriesInfo() async {
    try {
      final Uri uri = Uri.https(
        heroku_2_base_url,
        'v2/countries',
      );
      final Response response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        return (json.decode(response.body) as List<dynamic>)
            .map((dynamic res) =>
                CountriesInfoDto.fromJsonMap(res as Map<String, dynamic>))
            .toList();
      }
      CoronaBloc()
          .countriesInfoDtoBehaviorSubject$
          .addError(response.statusCode);
    } catch (e, s) {
      logger.severe("error while calling getAllCountriesInfo api", e, s);
      CoronaBloc().countriesInfoDtoBehaviorSubject$.addError(e, s);
    }
    return null;
  }

  Future<List<CountriesInfoDto>> getAllCountriesInfoSortedBy(
      {String sortBy}) async {
    try {
      final Uri uri = Uri.https(
        heroku_2_base_url,
        'v2/countries',
        {"sort": sortBy},
      );
      final Response response = await http.get(
        uri,
        headers: headers,
      );
      if (response.statusCode == HttpStatus.ok) {
        return (json.decode(response.body) as List<dynamic>)
            .map((dynamic res) =>
                CountriesInfoDto.fromJsonMap(res as Map<String, dynamic>))
            .toList();
      }
      CoronaBloc()
          .countriesInfoDtoBehaviorSubject$
          .addError(response.statusCode);
    } catch (e, s) {
      logger.severe(
          "error while calling getAllCountriesInfoSortedBy api", e, s);
      CoronaBloc().countriesInfoDtoBehaviorSubject$.addError(e, s);
    }
    return null;
  }

  Future<CountryInfoTimelineDto> getCountriesInfoTimeLine(
      String countryName) async {
    try {
      final Uri uri = Uri.https(
        heroku_2_base_url,
        'v2/historical/$countryName',
      );
      final Response response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        return CountryInfoTimelineDto.fromJsonMap(
          json.decode(response.body) as Map<String, dynamic>,
        );
      }
      CoronaBloc()
          .countriesInfoTimeLineDtoBehaviorSubject$
          .addError(response.statusCode);
    } catch (e, s) {
      logger.severe(
          "error while calling getCountriesInfoTimeLine api for $countryName",
          e,
          s);
      CoronaBloc().countriesInfoTimeLineDtoBehaviorSubject$.addError(e, s);
    }
    return null;
  }

  Future<List<UsaStateInfo>> getAllUsaInfo() async {
    try {
      final Uri uri = Uri.https(
        heroku_2_base_url,
        'v2/states',
      );
      final Response response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == HttpStatus.ok) {
        return (json.decode(response.body) as List<dynamic>)
            .map((dynamic res) =>
                UsaStateInfo.fromJsonMap(res as Map<String, dynamic>))
            .toList();
      }
      CoronaBloc()
          .countriesInfoDtoBehaviorSubject$
          .addError(response.statusCode);
    } catch (e, s) {
      logger.severe("error while calling getAllCountriesInfo api", e, s);
      CoronaBloc().countriesInfoDtoBehaviorSubject$.addError(e, s);
    }
    return null;
  }
}