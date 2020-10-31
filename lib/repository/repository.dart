import 'package:movieapps_apitmdb/model/cast_response.dart';
import 'package:movieapps_apitmdb/model/genre_response.dart';
import 'package:movieapps_apitmdb/model/movie_detail_response.dart';
import 'package:movieapps_apitmdb/model/movie_response.dart';
import 'package:movieapps_apitmdb/model/person_response.dart';
import 'package:movieapps_apitmdb/model/video_response.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final String apiKey = "d0bdd48ffbc0df8fdbac5fb0b05f3623";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonsUrl = '$mainUrl/trending/person/week';
  var movieUrl = '$mainUrl/movie';

  // Get Popular Movies
  Future<MovieResponse> getMovies() async {
    var params = {
      "api_key": apiKey,
      // "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return MovieResponse.withError("$error");
    }
  }

  // Get Now Playing
  Future<MovieResponse> getPlayingMovies() async {
    var params = {
      "api_key": apiKey,
      // "language": "en-US",
      "page": 1,
    };
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return MovieResponse.withError("$error");
    }
  }

  // Get Genre Movies
  Future<GenreResponse> getGenres() async {
    var params = {
      "api_key": apiKey,
      // "language": "en-US",
      "page": 1,
    };
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return GenreResponse.withError("$error");
    }
  }

  // Get Persons Movies
  Future<PersonResponse> getPersons() async {
    var params = {"api_key": apiKey};
    try {
      Response response =
          await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return PersonResponse.withError("$error");
    }
  }

  // Get Movies by Genre
  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      // "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return MovieResponse.withError("$error");
    }
  }

  // Get Detail Movies
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {
      "api_key": apiKey,
      // "language": "en-US",
    };
    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  // Get Casts
  Future<CastResponse> getCasts(int id) async {
    var params = {
      "api_key": apiKey,
      // "language": "en-US",
    };
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return CastResponse.withError("$error");
    }
  }

  // Get Similar Movies
  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {
      "api_key": apiKey,
      // "language": "en-US",
    };
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {
      "api_key": apiKey,
      // "language": "en-US",
    };
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print("Exception occured: $error stackTrace: $stackTrace");
      return VideoResponse.withError("$error");
    }
  }
}
